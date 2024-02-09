import 'package:ecommerce_app/service/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  final EmailPasswordAuthService emailAuthService = EmailPasswordAuthService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return await emailAuthService.signUpWithEmail(email, password);
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await emailAuthService.signInWithEmail(email, password);
  }

  Future<void> signOutWithEmail() async {
    return await emailAuthService.signOutWithEmail();
  }

  Future<void> googleSignIn() async {
    await emailAuthService.googleSignIn();
    notifyListeners();
  }

  Future<void> gitHubSignIn() async {
    await emailAuthService.gitHubSign();
    notifyListeners();
  }

  clearControllers() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    notifyListeners();
  }
}
