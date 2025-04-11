// In welcome1.dart file
import 'package:flutter/material.dart';

class welcome1 extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;
  
  // Constructor that takes callback functions for navigation
  const welcome1({
    super.key, 
    required this.onSkip, 
    required this.onNext
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
            if (details.primaryVelocity! < 0) {
              // Swipe left to go to page 2
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
                        // IDDSI Logo (complete logo as one image)
                        Image.asset(
                          'assets/IDDSI-logo.png',
                          width: 280,
                          // Maintain aspect ratio
                          fit: BoxFit.fitWidth,
                        ),
                        
                        const SizedBox(height: 80),
                        
                        // Main heading
                        const Text(
                          'The Standard\nIDDSI Framework',
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
                
                // Page indicator and navigation buttons
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      // Page indicator dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF2350C8),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.shade400),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Navigation buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Skip button - navigate to welcome3
                            ElevatedButton(
                              onPressed: onSkip,  // FIXED: Removed the () => part
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF7EA6A3),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              ),
                              child: const Text('skip'),
                            ),
                            
                            // Next arrow button - navigate to welcome2
                            ElevatedButton(
                              onPressed: onNext,  // FIXED: Removed the () => part
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2350C8),
                                foregroundColor: Colors.white,
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(16),
                              ),
                              child: const Icon(Icons.arrow_forward),
                            ),
                          ],
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