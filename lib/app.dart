import 'package:flutter/material.dart';
import 'home_page.dart';
import 'therapists_login.dart';
import 'what_is_iddsi.dart';
import 'what_is_dysphagia.dart';
import 'signs&symptoms.dart';
import 'disclaimer.dart';

class IDDSIApp extends StatelessWidget {
  const IDDSIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const IDDSIHomePage(),
        '/therapist-login': (context) => const TherapistLoginPage(),
        '/what-is-iddsi': (context) => const WhatIsIDDSIPage(),
        '/what-is-dysphagia': (context) => const WhatIsDysphagiaPage(),
        '/signs-and-symptoms': (context) => const SignsAndSymptomsPage(),
        '/disclaimer': (context) => const DisclaimerPage(),
      },
    );
  }
}