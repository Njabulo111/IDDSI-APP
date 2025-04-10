import 'package:flutter/material.dart';
import 'home_page.dart';
import 'welcome_page1.dart';
import 'welcome_page2.dart';
import 'welcome_page3.dart';
import 'sign_in_page.dart';  // Import the LoginPage
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
        '/welcome1': (context) => welcome1(
          onSkip: (context) {
            // Navigate to WelcomePage2 on Skip
            Navigator.pushNamed(context, '/welcome2');
          },
          onNext: (context) {
            // Navigate to WelcomePage2 on Next
            Navigator.pushNamed(context, '/welcome2');
          },
        ),
        '/welcome2': (context) => welcome2(
          onNext: () {
            // Navigate to WelcomePage3 on Next
            Navigator.pushNamed(context, '/welcome3');
          },
          onPrevious: () {
            // Navigate back to WelcomePage1 on Previous
            Navigator.pushNamed(context, '/welcome1');
          },
        ),
        '/welcome3': (context) => welcome3(
          onLogin: () {
            // Navigate to SignInPage on Login
            Navigator.pushNamed(context, '/signin');
          },
          onRegister: () {
            // Navigate to RegisterPage on Register
            Navigator.pushNamed(context, '/register');
          },
          onPrevious: () {
            // Navigate back to WelcomePage2 on Previous
            Navigator.pushNamed(context, '/welcome2');
          },
        ),
        '/signin': (context) => const LoginPage(), // Link to SignInPage
        '/register': (context) => const RegisterPage(),
        '/forgotpassword': (context) => const ForgotPasswordPage(),
        '/home': (context) => const IDDSIHomePage(),
      },
    );
  }
}
