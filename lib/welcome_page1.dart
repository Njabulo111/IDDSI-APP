import 'package:flutter/material.dart';

class welcome1 extends StatelessWidget {
  final Function onSkip;
  final Function onNext;
  
  // Constructor that takes callback functions for navigation
  const welcome1({
    super.key, 
    required this.onSkip, 
    required this.onNext
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
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
              
              // Logo and content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IDDSI Logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Globe icon
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/iddsi-logo.png',
                              // If you don't have the exact image, use the Icon as fallback
                              errorBuilder: (context, error, stackTrace) => 
                                const Icon(Icons.public, size: 60, color: Colors.green),
                            ),
                          ),
                          // IDDSI text
                          Text(
                            'IDDSI',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                      
                      // Red line under logo
                      Container(
                        height: 3,
                        width: 300,
                        color: Colors.red.shade800,
                        margin: const EdgeInsets.only(top: 4),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Subtitle text
                      Text(
                        'International Dysphagia Diet\nStandardisation Initiative',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      
                      const SizedBox(height: 60),
                      
                      // Main heading
                      Text(
                        'The Standard\nIDDSI Framework',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade600,
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Subtitle description
                      Text(
                        'Providing a common terminology for\ndescribing food textures and drink\nthicknesses.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.teal.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Page indicator and navigation buttons
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    // Page indicator dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Navigation buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Skip button
                          ElevatedButton(
                            onPressed: () => onSkip(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal.shade300,
                              foregroundColor: Colors.white,
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(16),
                            ),
                            child: const Text('skip'),
                          ),
                          
                          // Next arrow button
                          ElevatedButton(
                            onPressed: () => onNext(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade700,
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
    );
  }
}