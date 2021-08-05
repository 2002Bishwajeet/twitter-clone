/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/tweetModel.dart';
import 'package:twitter_clone/providers/user_provider.dart';

final tweetTextProvider = StateProvider<String>((ref) {
  return '';
});

final tweetClassProvider = Provider<Tweet>((ref) {
  return Tweet();
});

final tweetStreamProvider = StreamProvider<QuerySnapshot>((ref) {
  return ref.watch(firestoreProvider).collection('tweets').snapshots();
});
