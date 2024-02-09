// GoogleAuthService.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  String collection = 'UserPost';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> googelSignIn() async {
    try {
      // Perform Google Sign-In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Obtain credential from GoogleSignInAuthentication
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in with Firebase using the obtained credential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Retrieve user information
      final User? guser = userCredential.user;

      // Create an AuthenticationModel instance
      final authenticationModel = AuthenticationModel(
        email: guser?.email,
        name: guser?.displayName,
        phoneNumber: guser?.phoneNumber,
        userId: guser?.uid,
      );

      // Store user data in Firestore
      await firestore.collection(collection).doc(guser?.uid).set(
            authenticationModel.toJson(),
          );
    } catch (e) {
      print('Google Sign-In Error: $e'); // Log any errors during sign-in
      throw e; // Rethrow the error for handling in UI if necessary
    }
  }
}
