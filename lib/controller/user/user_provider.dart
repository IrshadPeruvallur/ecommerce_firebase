// import 'package:ecommerce_app/controller/authentication/email_password.dart';
// import 'package:flutter/material.dart';

// class UserProvider extends ChangeNotifier {
  
//   final EmailPasswordAuthProvider emailAuthProvider =
//       EmailPasswordAuthProvider();
//   final formKey = GlobalKey<FormState>();
//   createUserWithEmail() {
//     emailAuthProvider.signUpWithEmail(
//         emailController.text.trim(), passwordController.text.trim());
//     clearControllers();
//     notifyListeners();
//   }

//   loginUserWithEmail() {
//     emailAuthProvider.signInWithEmail(
//         emailController.text, passwordController.text);
//     clearControllers();
//     notifyListeners();
//   }

//   void logOutUserWithEmail() {
//     emailAuthProvider.signOutWithEmail();
//   }

// }
