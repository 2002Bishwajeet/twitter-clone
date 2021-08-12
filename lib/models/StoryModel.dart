
/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:twitter_clone/models/getUserProfile.dart';

class StoryModel {
  final String name;
  final String imgUrl;
  final String profileUrl;
  final DateTime dateAdded;
  final String handle;
  StoryModel({
    required this.name,
    required this.imgUrl,
    required this.profileUrl,
    required this.dateAdded,
    required this.handle,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imgUrl': imgUrl,
      'profileUrl': profileUrl,
      'dateAdded': dateAdded.millisecondsSinceEpoch,
      'handle': handle,
    };
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      name: map['name'],
      imgUrl: map['imgUrl'],
      profileUrl: map['profileUrl'],
      dateAdded: DateTime.fromMillisecondsSinceEpoch(map['dateAdded']),
      handle: map['handle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryModel.fromJson(String source) =>
      StoryModel.fromMap(json.decode(source));
}

class Stories {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final String id = FirebaseAuth.instance.currentUser!.uid;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  CollectionReference story = FirebaseFirestore.instance.collection('stories');

  Future<void> createStory(String filePath, String imgName) async {
    File file = File(filePath);

    try {
      await storage.ref('Stories/$imgName').putFile(file);
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
    }
    UserProfile? profiledata;

    try {
      await users.doc(id).get().then((data) async {
        profiledata = UserProfile.fromMap(data.data() as Map<String, dynamic>);
      });

      story.add({
        'name': profiledata!.name,
        'imgUrl': await storage.ref('Stories/$imgName').getDownloadURL(),
        'dateAdded': DateTime.now().millisecondsSinceEpoch,
        'profileUrl': profiledata!.avatarUrl,
        'handle': profiledata!.handle,
      });
    } catch (e) {
      print(e);
    }
  }

// TODO - Make this future Fucntion return AsyncValue . We will use the list in main widget
  Future<List<StoryModel>> getStories() async {
    List<StoryModel> stories = [];
    try {
      await story.get().then((data) async {
        data.docs.forEach((doc) async {
          stories.add(StoryModel.fromMap(doc.data() as Map<String, dynamic>));
        });
      });
    } catch (e) {
      print(e);
    }
    print(stories);
    return stories;
  }
}
