/*
  Developed by Bishwajeet Parhi
  GitHub: https://github.com/2002Bishwajeet
  Twitter: https://twitter.com/biswa_20p
  Feel free to improve the  twitter_clone Repo.
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:twitter_clone/models/CreateUserModel.dart';
import 'package:twitter_clone/models/getUserProfile.dart';
import 'package:twitter_clone/providers/auth_provider.dart';

final firebaseStorageProvider =
    Provider<firebase_storage.FirebaseStorage>((ref) {
  return firebase_storage.FirebaseStorage.instance;
});

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final userProvider = Provider<CreateUser>(
    (ref) => CreateUser(ref.read(firebaseStorageProvider)));

final getUserProfileDataProvider = FutureProvider<UserProfile>((ref) {
  return GetUserProfileData(ref.watch(firestoreProvider),
          ref.watch(fireBaseAuthProvider).currentUser!.uid)
      .getprofileData();
});
