// GoogleAuthenticationProvider.dart

import 'package:flutter/material.dart';
import 'package:ecommerce_app/service/authentication/google_auth.dart';

class GoogleAuthenticationProvider extends ChangeNotifier {
  final GoogleAuthService googleAuthService = GoogleAuthService();

  // Method to initiate Google Sign-In
  Future<void> googleSignIn() async {
    try {
      await googleAuthService.googelSignIn();
      notifyListeners(); // Notify listeners after successful sign-in
    } catch (e) {
      print('Google Sign-In Error: $e'); // Log any errors during sign-in
      throw e; // Rethrow the error for handling in UI if necessary
    }
  }
}
