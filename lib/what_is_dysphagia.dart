import 'package:flutter/material.dart';

class WhatIsDysphagiaPage extends StatelessWidget {
  const WhatIsDysphagiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What is Dysphagia'),
        backgroundColor: const Color(0xFF4C7378),
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Understanding Dysphagia',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4C7378)),
            ),
            SizedBox(height: 20),
            Text(
              'Dysphagia is the medical term for swallowing difficulties. It affects people of all ages and can occur following stroke, in people with progressive neurological diseases, and many other conditions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              'When someone has dysphagia, they may have difficulty swallowing certain foods or liquids, or they may be unable to swallow at all. This can lead to serious health complications including:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Aspiration pneumonia', style: TextStyle(fontSize: 16)),
                  Text('• Dehydration', style: TextStyle(fontSize: 16)),
                  Text('• Malnutrition', style: TextStyle(fontSize: 16)),
                  Text('• Choking', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Proper management of dysphagia, often with the help of speech and language therapists and dietitians, is essential for health and quality of life.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}