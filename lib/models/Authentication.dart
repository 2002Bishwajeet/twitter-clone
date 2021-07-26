import 'package:firebase_auth/firebase_auth.dart';

// https://www.youtube.com/watch?v=ome7acabO58 Refer to this video for RiverPod Authentication Firebase
class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;

  Authentication(this.auth);

  Stream<User?> get authStateChange => auth.authStateChanges();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Email already in use.');
      } else if (e.code == 'invalid-email') {
        print('Invalid email provided.');
      } else if (e.code == 'invalid-password') {
        print('Invalid password provided.');
      } else if (e.code == 'too-many-requests') {
        print('Too many requests.');
      } else {
        print('Error: $e');
      }
    } catch (e) {
      if (e == 'email-already-in-use') {
        print('Email already in use.');
      } else {
        print('Error: $e');
      }
    }
  }

  Future<void> logOut() async {
    await auth.signOut(); // Sign out the current user.
  }
}
