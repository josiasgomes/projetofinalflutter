// ignore_for_file: unused_field

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/foundation.dart";

ValueNotifier<AuthService> authService = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get access to the current user
  User? get currentUser => _auth.currentUser;

  // return information about to the user to know if he´s connected or not
  Stream<User?> get authStateChanges => _auth.authStateChanges();

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
  Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //3. sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  //4; reset password
  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
