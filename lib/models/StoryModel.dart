/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StoryModel {
  final String name;
  final String id;
  final String imgUrl;
  StoryModel({
    required this.name,
    required this.id,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'imgUrl': imgUrl,
    };
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      name: map['name'],
      id: map['id'],
      imgUrl: map['imgUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryModel.fromJson(String source) =>
      StoryModel.fromMap(json.decode(source));
}

class StoryItemModel {
  final String handle;
  final String profilePicture;
  final String id;
  final String picture;

  StoryItemModel({
    required this.handle,
    required this.profilePicture,
    required this.id,
    required this.picture,
  });

  Map<String, dynamic> toMap() {
    return {
      'handle': handle,
      'profilePicture': profilePicture,
      'id': id,
      'picture': picture,
    };
  }

  factory StoryItemModel.fromMap(Map<String, dynamic> map) {
    return StoryItemModel(
      handle: map['handle'],
      profilePicture: map['profilePicture'],
      id: map['id'],
      picture: map['picture'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryItemModel.fromJson(String source) =>
      StoryItemModel.fromMap(json.decode(source));
}

class Stories {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  CollectionReference story = FirebaseFirestore.instance.collection('stories');

  Future<void> createStory(String filePath, String imgName, String name) async {
    File file = File(filePath);

    try {
      await storage.ref('Stories/$imgName').putFile(file);
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
    }

    try {
      story.add({
        'name': name,
        'img': await storage.ref('Stories/$imgName').getDownloadURL(),
        'dateAdded': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      print(e);
    }
  }
}
