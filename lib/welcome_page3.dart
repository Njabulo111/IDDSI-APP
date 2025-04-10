import 'package:flutter/material.dart';

class welcome3 extends StatelessWidget {
  final Function onLogin;
  final Function onRegister;
  final Function onPrevious;
  
  // Constructor that takes callback functions for navigation
  const welcome3({
    super.key, 
    required this.onLogin, 
    required this.onRegister,
    required this.onPrevious
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        // Enable swipe navigation
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            // Swipe right to go back to page 2
            onPrevious();
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              // App Bar with time and status icons
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '5:13 PM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(width: 8),
                        Icon(Icons.bluetooth),
                        SizedBox(width: 8),
                        Icon(Icons.wifi),
                        SizedBox(width: 8),
                        Icon(Icons.signal_cellular_4_bar),
                        SizedBox(width: 8),
                        Icon(Icons.battery_full),
                      ],
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Speech Therapy Logo
                      Container(
                        width: 160,
                        height: 160,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/speech.logo.png',
                          // If you don't have the exact image, use a placeholder
                          errorBuilder: (context, error, stackTrace) => 
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.hearing,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Department text
                      const Text(
                        'SPEECH THERAPY\nAND AUDIOLOGY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Hospital text
                      Text(
                        'Department at Chris Hani\nBaragwanath Academic Hospital',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      
                      const SizedBox(height: 60),
                      
                      // Welcome text
                      Text(
                        'Welcome to the\nIDDSI App',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade600,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Helping text
                      Text(
                        'Helping you navigate dysphagia safely',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.teal.shade600,
                        ),
                      ),
                      
                      const SizedBox(height: 60),
                      
                      // Login and Register buttons
                      Row(
                        children: [
                          // Login button
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => onLogin(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade700,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 56),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          
                          const SizedBox(width: 16),
                          
                          // Register button
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => onRegister(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 56),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.grey.shade300),
                                ),
                                elevation: 2,
                                shadowColor: Colors.grey.shade200,
                              ),
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}