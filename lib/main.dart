import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart'; // Import the app with routing and logic

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyC0ENNhrABPVqFGWRupcJtH5G49rRbqcfo",
          authDomain: "iddsi-app.firebaseapp.com",
          projectId: "iddsi-app",
          storageBucket: "iddsi-app.appspot.com",
          messagingSenderId: "844640842201",
          appId: "1:844640842201:web:903d21c590150b6d5be9c8", // ✅ FIXED APP ID
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
    debugPrint('✅ Firebase initialized successfully');
  } catch (e) {
    debugPrint('❌ Error initializing Firebase: $e');
  }

  // Load whether the user has already seen the welcome screens
  final prefs = await SharedPreferences.getInstance();
  final hasSeenWelcome = prefs.getBool('hasSeenWelcome') ?? false;

  runApp(IDDSIApp(hasSeenWelcome: hasSeenWelcome));
}
