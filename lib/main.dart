import 'package:ecommerce_app/controller/authentication/email_password.dart';
import 'package:ecommerce_app/controller/user/user_provider.dart';
import 'package:ecommerce_app/service/firebase_options.dart';
import 'package:ecommerce_app/view/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EmailPasswordAuthProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => UserProvider(),
        // ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(color: Colors.black),
          ),
          colorScheme: ColorScheme.light(),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Welcome(),
      ),
    );
  }
}
