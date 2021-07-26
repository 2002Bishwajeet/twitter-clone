import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/Authentication.dart';

final fireBaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

//  isse tu sab kuch woh function bula sakta hai  of Authentication classlike signIn signOut jo maine banaye hai
final authServicesProvider = Provider<Authentication>((ref) {
  return Authentication(ref.read(fireBaseAuthProvider));
});

final authStateProvider = StreamProvider<User?>(
    (ref) => ref.watch(authServicesProvider).authStateChange);
