import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;
  String _message = '';
  bool _isEmailValid = true;

  final String _forgotPasswordUrl = 
    'https://ujprojectiddsi-daakdjchhecydbew.canadacentral-01.azurewebsites.net/api/Auth/ForgotPassword';

  // Email validation function
  bool _validateEmailFormat(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Check if email exists
  Future<bool> _checkEmailExists(String email) async {
    try {
      final response = await http.post(
        Uri.parse('https://ujprojectiddsi-daakdjchhecydbew.canadacentral-01.azurewebsites.net/api/Auth/CheckEmail'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData['exists'] ?? false;
      }
      return false;
    } catch (e) {
      print('Error checking email: $e');
      return false;
    }
  }

  // LogIn API call (still included in case needed later)
  Future<void> _logInWithEmail() async {
    final email = _emailController.text.trim();

    try {
      final response = await http.post(
        Uri.parse('https://ujprojectiddsi-daakdjchhecydbew.canadacentral-01.azurewebsites.net/api/Auth/LogIn'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        setState(() {
          _message = 'Login request successful.';
        });
      } else {
        setState(() {
          _message = 'Login failed. Please try again.';
        });
      }
    } catch (e) {
      setState(() {
        _message = 'Error occurred during login.';
      });
    }
  }

  void _submitEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
      _message = '';
    });

    final email = _emailController.text.trim();

    try {
      // First check if the email exists in the database
      final emailExists = await _checkEmailExists(email);

      if (!emailExists) {
        setState(() {
          _isSubmitting = false;
          _message = 'Email not found. Please create an account.';
        });
        return;
      }

      // If email exists, proceed with password reset
      final response = await http.post(
        Uri.parse(_forgotPasswordUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        // Reset request sent successfully
        setState(() {
          _message = 'Reset code sent! Check your email.';
        });
      } else {
        setState(() {
          _message = 'Something went wrong. Please try again.';
        });
      }
    } catch (e) {
      setState(() {
        _message = 'Failed to connect to the server.';
      });
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF1F41BB); // Matches the blue in the image

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          // Light blue overlay
          Positioned.fill(
            child: Container(
              color: Colors.blue.shade50.withOpacity(0.8),
            ),
          ),
          // Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: blue,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Enter your email address below\nto retrieve your password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 40),

                        if (_message.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _message.contains('sent') 
                                  ? Colors.green.shade100 
                                  : Colors.red.shade100,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _message.contains('sent') 
                                    ? Colors.green.shade300 
                                    : Colors.red.shade300,
                              ),
                            ),
                            child: Text(
                              _message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: _message.contains('sent') 
                                    ? Colors.green.shade900 
                                    : Colors.red.shade900,
                              ),
                            ),
                          ),

                        // Email field
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: blue, width: 2),
                            color: Colors.blue.shade50,
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: Colors.grey.shade600),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() => _isEmailValid = false);
                                return 'Please enter your email';
                              }
                              if (!_validateEmailFormat(value)) {
                                setState(() => _isEmailValid = false);
                                return 'Please enter a valid email';
                              }
                              setState(() => _isEmailValid = true);
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Submit button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: _isSubmitting ? null : _submitEmail,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              disabledBackgroundColor: Colors.blue.shade300,
                            ),
                            child: _isSubmitting
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Create an account link
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/register');
                          },
                          child: Text(
                            'Create an account',
                            style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
