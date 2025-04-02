import 'package:flutter/material.dart';

class DisclaimerPage extends StatelessWidget {
  const DisclaimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disclaimer'),
        backgroundColor: const Color(0xFF4C7378),
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Important Information',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4C7378)),
            ),
            SizedBox(height: 20),
            Text(
              'This app is designed to provide general information about dysphagia and the IDDSI framework. It is not intended to replace personalized medical advice from healthcare professionals.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              'Always consult with a qualified healthcare provider for diagnosis and treatment of swallowing difficulties.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'The information provided in this app is based on current IDDSI guidelines but may not be exhaustive. Healthcare settings may have specific protocols that differ slightly from the information presented here.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              'In case of emergency or acute difficulty swallowing, seek immediate medical attention.',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            SizedBox(height: 20),
            Text(
              'App Usage',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4C7378)),
            ),
            SizedBox(height: 10),
            Text(
              'This app is intended for educational purposes and as a reference tool. Users should ensure they follow the specific recommendations provided by their healthcare team.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}