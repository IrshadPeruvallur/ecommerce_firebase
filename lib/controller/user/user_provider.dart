import 'package:ecommerce_app/controller/authentication/email_password.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final EmailPasswordAuthProvider emailAuthProvider =
      EmailPasswordAuthProvider();
  final formKey = GlobalKey<FormState>();
  createUserWithEmail() {
    emailAuthProvider.signUpWithEmail(
        emailController.text.trim(), passwordController.text.trim());
    // clearControllers();
    notifyListeners();
  }

  clearControllers() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
