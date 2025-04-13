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
      initialRoute: '/welcome1',
      routes: {
        '/': (context) => const IDDSIHomePage(),
        '/welcome1': (context) => welcome1(
              onSkip: () {
                Navigator.pushNamed(context, '/welcome3');
              },
              onNext: () {
                Navigator.pushNamed(context, '/welcome2');
              },
            ),
        '/welcome2': (context) => welcome2(
              onNext: () {
                Navigator.pushNamed(context, '/welcome3');
              },
              onPrevious: () {
                Navigator.pushNamed(context, '/welcome1');
              },
            ),
        '/welcome3': (context) => welcome3(
              onLogin: () {
                Navigator.pushNamed(context, '/signin');
              },
              onRegister: () {
                Navigator.pushNamed(context, '/register');
              },
              onPrevious: () {
                Navigator.pushNamed(context, '/welcome2');
              },
            ),
        '/signin': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgotPassword': (context) => const ForgotPasswordPage(), // Updated route name to match usage in sign-in page
        '/home': (context) => const IDDSIHomePage(),
      },
    );
  }
}