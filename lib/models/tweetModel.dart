import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'getUserProfile.dart';

class TweetModel {
  final String imgUrl;
  final String name;
  final String handle;
  final String tweet;
  final int likes;
  final int retweets;
  final int comments;
  final DateTime createdAt;
  TweetModel({
    required this.imgUrl,
    required this.name,
    required this.handle,
    required this.tweet,
    required this.likes,
    required this.retweets,
    required this.comments,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': imgUrl,
      'name': name,
      'handle': handle,
      'tweet': tweet,
      'likes': likes,
      'retweets': retweets,
      'comments': comments,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory TweetModel.fromMap(Map<String, dynamic> map) {
    return TweetModel(
      imgUrl: map['imgUrl'],
      name: map['name'],
      handle: map['handle'],
      tweet: map['tweet'],
      likes: map['likes'],
      retweets: map['retweets'],
      comments: map['comments'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TweetModel.fromJson(String source) =>
      TweetModel.fromMap(json.decode(source));

  TweetModel copyWith({
    String? imgUrl,
    String? name,
    String? handle,
    String? tweet,
    int? likes,
    int? retweets,
    int? comments,
    DateTime? createdAt,
  }) {
    return TweetModel(
      imgUrl: imgUrl ?? this.imgUrl,
      name: name ?? this.name,
      handle: handle ?? this.handle,
      tweet: tweet ?? this.tweet,
      likes: likes ?? this.likes,
      retweets: retweets ?? this.retweets,
      comments: comments ?? this.comments,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'TweetModel(imgUrl: $imgUrl, name: $name, handle: $handle, tweet: $tweet, likes: $likes, retweets: $retweets, comments: $comments, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TweetModel &&
        other.imgUrl == imgUrl &&
        other.name == name &&
        other.handle == handle &&
        other.tweet == tweet &&
        other.likes == likes &&
        other.retweets == retweets &&
        other.comments == comments &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return imgUrl.hashCode ^
        name.hashCode ^
        handle.hashCode ^
        tweet.hashCode ^
        likes.hashCode ^
        retweets.hashCode ^
        comments.hashCode ^
        createdAt.hashCode;
  }
}

class Tweet {
  //  This class contains functions such as write a tweet to the database, get the tweet data from the database,
  FirebaseFirestore store = FirebaseFirestore.instance;
  String id = FirebaseAuth.instance.currentUser!.uid;

  Future<void> postTweet(String tweet) async {
    CollectionReference tweets = store.collection('tweets');
    final UserProfile userData = await GetUserProfileData(store, id)
        .getprofileData(); // to get the profile Picture and other details

    final tweetsref = tweets.withConverter<TweetModel>(
        fromFirestore: (snapshot, _) => TweetModel.fromMap(snapshot.data()!),
        toFirestore: (tweets, _) => tweets.toMap());

    tweetsref.add(TweetModel(
        imgUrl: userData.avatarUrl,
        name: userData.name,
        handle: userData.handle,
        tweet: tweet,
        likes: 0,
        retweets: 0,
        comments: 0,
        createdAt: DateTime.now()));
  }

  Future<Stream<QuerySnapshot>> getTweet() async {
    Stream<QuerySnapshot> tweets = store
        .collection('tweets')
        .orderBy('createdAt', descending: true)
        .snapshots();
    // final tweetsref = tweets.withConverter<TweetModel>(
    //     fromFirestore: (snapshot, _) => TweetModel.fromMap(snapshot.data()!),
    //     toFirestore: (tweets, _) => tweets.toMap());

    // tweetsList = await tweetsref.get().then((value) => value.docs);
    return tweets;
  }

  // List<TweetModel> tweetsList = [];
}
