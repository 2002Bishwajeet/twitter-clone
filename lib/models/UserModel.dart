import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';

class User {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final String id = FirebaseAuth.instance.currentUser!.uid;

  User(this.storage);

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<String> addProfilePicture(String filePath, String name) async {
    File file = File(filePath);

    try {
      await storage.ref('userProfilePictures/$name').putFile(file);
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
    }
    // print(await ref.getDownloadURL());
    return await storage.ref('userProfilePictures/$name').getDownloadURL();
  }

  Future<void> addUser(String name, String twitterHandle, String url) async {
    try {
      users.doc(id).set({
        'name': name,
        'twitterHandle': twitterHandle,
        'followers': 0,
        'following': 0,
        'profilePicure': url,
      });
      print(url);
    } catch (e) {
      print(e);
    }
  }
}
