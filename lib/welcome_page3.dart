import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_gate.dart'; // Make sure this path is correct

class welcome3 extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onRegister;
  final VoidCallback onPrevious;

  const welcome3({
    super.key,
    required this.onLogin,
    required this.onRegister,
    required this.onPrevious,
  });

  Future<void> _handleAction(BuildContext context, bool isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenWelcome', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AuthGate()),
    );
  }

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
              // Swipe right to go back to page 2
              onPrevious();
            }
          },
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/speech.logo.png',
                          width: 280,
                          fit: BoxFit.fitWidth,
                        ),
                        const SizedBox(height: 60),
                        const Text(
                          'Welcome to the\nIDDSI App',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A7A8C),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Helping you navigate dysphagia safely',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF7BA9BA),
                          ),
                        ),
                        const SizedBox(height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Login button
                            SizedBox(
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () => _handleAction(context, true),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2350C8),
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Register button
                            SizedBox(
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () => _handleAction(context, false),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black87,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                  elevation: 2,
                                  shadowColor: Colors.grey.shade200,
                                ),
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
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
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
