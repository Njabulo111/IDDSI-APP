import 'package:flutter/material.dart';

class welcome2 extends StatelessWidget {
  final Function onNext;
  final Function onPrevious;
  
  // Constructor that takes callback functions for navigation
  const welcome2({
    super.key, 
    required this.onNext, 
    required this.onPrevious
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          // Enable swipe navigation
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              // Swipe right to go back to page 1
              onPrevious();
            } else if (details.primaryVelocity! < 0) {
              // Swipe left to go to page 3
              onNext();
            }
          },
          child: SafeArea(
            child: Column(
              children: [
                // Status bar space
                const SizedBox(height: 20),
                
                // Logo and content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Speech Therapy Logo (complete logo as one image)
                        Image.asset(
                          'assets/speech.logo.png',
                          width: 280,
                          // Maintain aspect ratio
                          fit: BoxFit.fitWidth,
                        ),
                        
                        const SizedBox(height: 60),
                        
                        // Main heading
                        const Text(
                          'Baragwanath Hospital\nFood Library',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A7A8C),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Subtitle description
                        const Text(
                          'Providing a common terminology for\ndescribing food textures and drink\nthicknesses.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4A7A8C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Page indicator and get started button
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      // Page indicator dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // White dot (previous page) - clickable
                          GestureDetector(
                            onTap: () => onPrevious(),
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade400),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Blue dot (current page)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF2350C8),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Let's Get Started button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ElevatedButton(
                          onPressed: () => onNext(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2350C8),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            "LET'S GET STARTED",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}