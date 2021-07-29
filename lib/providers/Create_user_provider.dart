import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:twitter_clone/models/UserModel.dart';

final firebaseStorageProvider =
    Provider<firebase_storage.FirebaseStorage>((ref) {
  return firebase_storage.FirebaseStorage.instance;
});

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final userProvider =
    Provider<User>((ref) => User(ref.read(firebaseStorageProvider)));
