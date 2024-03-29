import 'package:ecommerce_app/controller/authentication.dart';
import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/controller/user_provider.dart';
import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/view/welcome%20screens/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DatabaseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WidgetProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 37, 157, 192),
          textTheme: TextTheme(
            titleLarge: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: GoogleFonts.montserrat(
              color: Colors.black,
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 37, 157, 192),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 37, 157, 192),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Welcome(),
      ),
    );
  }
}
