// ignore_for_file: unused_field

import "package:firebase_auth/firebase_auth.dart";

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get access to the current user
  User? get currentUser => _auth.currentUser;

  // return information about to the user to know if he´s connected or not
  Stream<User> get authStateChanges => _auth.authStateChanges();

  //1. sign in
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  //2. register

  //3. sign out
}
