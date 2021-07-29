import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class User {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  User(this.storage);

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late String url;
  Future<void> addProfilePicture(String filePath, String name) async {
    File file = File(filePath);

    try {
      // storage.ref('userProfilePictures/$name').putFile(file);

      firebase_storage.Reference ref =
          storage.ref().child("DP" + DateTime.now().toString());
      firebase_storage.UploadTask uploadTask = ref.putFile(file);
      uploadTask.whenComplete(() async {
        url = await ref.getDownloadURL();
        print(url);
      });
    } on firebase_storage.FirebaseException catch (e) {
      print('Error:  $e.message');
    } finally {
      file.delete();
    }
  }

  Future<void> addUser(String name, String twitterHandle) async {
    try {
      users.add({
        'name': name,
        'twitterHandle': twitterHandle,
        'followers': 0,
        'following': 0,
        'profilePicure': url,
      });
    } catch (e) {
      print(e);
    }
  }
}
