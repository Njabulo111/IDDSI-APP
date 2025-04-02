import 'package:flutter/material.dart';

class SignsAndSymptomsPage extends StatelessWidget {
  const SignsAndSymptomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signs and Symptoms'),
        backgroundColor: const Color(0xFF4C7378),
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recognizing Dysphagia',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4C7378)),
            ),
            SizedBox(height: 20),
            Text(
              'Common signs and symptoms of dysphagia include:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Coughing or choking when eating or drinking', style: TextStyle(fontSize: 16)),
                  Text('• A wet or gurgling voice after eating or drinking', style: TextStyle(fontSize: 16)),
                  Text('• The sensation that food is stuck in your throat', style: TextStyle(fontSize: 16)),
                  Text('• Recurrent chest infections', style: TextStyle(fontSize: 16)),
                  Text('• Weight loss and dehydration', style: TextStyle(fontSize: 16)),
                  Text('• Drooling or leaking food/liquid from the mouth', style: TextStyle(fontSize: 16)),
                  Text('• Taking a long time to chew or swallow', style: TextStyle(fontSize: 16)),
                  Text('• Bringing food back up, sometimes through the nose', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'When to See a Doctor',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4C7378)),
            ),
            SizedBox(height: 10),
            Text(
              'If you or someone you care for experiences persistent swallowing difficulties, it is important to consult a healthcare professional promptly. Early intervention can help prevent complications and improve outcomes.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}