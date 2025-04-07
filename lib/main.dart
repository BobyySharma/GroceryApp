import 'package:flutter/material.dart';
import 'package:untitled1/Splash.dart';
import 'package:untitled1/home_page.dart';
import 'package:untitled1/onboard.dart';
import 'package:untitled1/signup.dart';
import 'package:untitled1/login.dart';
import 'package:untitled1/home_page.dart';  // Import the GroceryApp file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GroFast',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),               // Splash screen
        '/onboarding': (context) => OnboardingScreen(), // Onboarding screen
        '/register': (context) => Register(),           // Register screen
        '/login': (context) => Login(),                 // Login screen
        '/home': (context) => GroceryApp(),             // Main app screen (Grocery App)
      },
    );
  }
}
