import 'package:flutter/material.dart';

class WhatIsIDDSIPage extends StatelessWidget {
  const WhatIsIDDSIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What is the IDDSI'),
        backgroundColor: const Color(0xFF4C7378),
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The International Dysphagia Diet Standardisation Initiative',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4C7378)),
            ),
            SizedBox(height: 20),
            Text(
              'IDDSI is a global initiative that provides standardized terminology and definitions for texture-modified foods and thickened liquids for people with dysphagia across the lifespan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              'The IDDSI framework consists of 8 levels (0-7) and includes both drinks and foods. The levels are identified by numbers, text labels, and color codes to improve safety and identification.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              'This standardization helps ensure consistency of care across different settings and between healthcare professionals, reducing the risk of confusion and error in food and drink preparation for people with dysphagia.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}