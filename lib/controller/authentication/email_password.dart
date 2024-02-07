import 'package:ecommerce_app/service/authentication/email_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailPasswordAuthProvider extends ChangeNotifier {
  final EmailPasswordAuthService emailAuthService = EmailPasswordAuthService();
  User? user;
  Future<void> signUpWithEmail(String email, String password) async {
    user = await emailAuthService.signUpWithEmail(email, password);
    notifyListeners();
  }
}
