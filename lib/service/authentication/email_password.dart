import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      log('Account created');
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }
}
