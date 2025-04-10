import 'package:flutter/material.dart';
import 'home_page.dart';
import 'welcome_page1.dart';
import 'welcome_page2.dart';
import 'welcome_page3.dart';
import 'sign_in_page.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';

class IDDSIApp extends StatelessWidget {
  const IDDSIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4C7378),
          primary: const Color(0xFF1F41BB),
        ),
      ),
      // Start with the first welcome page instead of home page
      initialRoute: '/welcome1',
      routes: {
        '/': (context) => const IDDSIHomePage(),
        '/welcome1': (context) => const WelcomePage1(),
        '/welcome2': (context) => const WelcomePage2(),
        '/welcome3': (context) => const WelcomePage3(),
        '/signin': (context) => const SignInPage(),
        '/register': (context) => const RegisterPage(),
        '/forgotpassword': (context) => const ForgotPasswordPage(),
        '/home': (context) => const IDDSIHomePage(),
      },
    );
  }
}