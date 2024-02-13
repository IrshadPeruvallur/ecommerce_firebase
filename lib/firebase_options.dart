// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBRSr6RXcbzRTxZSVV6vHsslw0-SXficwI',
    appId: '1:165199657749:web:37afb8b0a1b9834cbbc71c',
    messagingSenderId: '165199657749',
    projectId: 'e-commerce-5436c',
    authDomain: 'e-commerce-5436c.firebaseapp.com',
    storageBucket: 'e-commerce-5436c.appspot.com',
    measurementId: 'G-GKGN5CS613',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCb5FlRTTneWVAm3mE2X3RdjUaBtQY-YEI',
    appId: '1:165199657749:android:05c1959c8ef96f77bbc71c',
    messagingSenderId: '165199657749',
    projectId: 'e-commerce-5436c',
    storageBucket: 'e-commerce-5436c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBN-kOP8tX0VHCoq_7_LWXifJaJeAQ8mRY',
    appId: '1:165199657749:ios:26d8b6386552e306bbc71c',
    messagingSenderId: '165199657749',
    projectId: 'e-commerce-5436c',
    storageBucket: 'e-commerce-5436c.appspot.com',
    androidClientId: '165199657749-5c00ld5sosqf2d7veeubakrqv054mahp.apps.googleusercontent.com',
    iosClientId: '165199657749-gli2hll46guaspse2iugji95ogeud5v3.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBN-kOP8tX0VHCoq_7_LWXifJaJeAQ8mRY',
    appId: '1:165199657749:ios:5e2d048bf0cd9dc5bbc71c',
    messagingSenderId: '165199657749',
    projectId: 'e-commerce-5436c',
    storageBucket: 'e-commerce-5436c.appspot.com',
    androidClientId: '165199657749-5c00ld5sosqf2d7veeubakrqv054mahp.apps.googleusercontent.com',
    iosClientId: '165199657749-islun41k6ggn3emtikqold4v2nsn52rc.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp.RunnerTests',
  );
}
