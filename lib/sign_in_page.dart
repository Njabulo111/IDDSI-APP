import 'package:flutter/material.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';
  bool _isEmailValid = true;
  bool _obscurePassword = true;
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _isValidEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid = _isValidEmail(value);
    });
  }

  Future<void> _signIn() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    if (!_isEmailValid) return;

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    try {
      await AuthService().signIn(email: email, password: password);
        Navigator.pushReplacementNamed(context, '/home'); 
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceAll('Exception: ', '');
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final horizontalPadding = screenWidth * 0.08;
    final verticalPadding = screenHeight * 0.03;
    final buttonHeight = screenHeight * 0.07;
    final titleFontSize = screenWidth * 0.09;
    final subtitleFontSize = screenWidth * 0.06;
    final buttonFontSize = screenWidth * 0.05;
    final regularFontSize = screenWidth * 0.04;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.blue.shade50.withOpacity(0.8),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.06),
                      Text(
                        'Login here',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Welcome back to\nthe IDDSI App!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      if (_errorMessage.isNotEmpty)
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.02),
                            border: Border.all(color: Colors.red.shade300),
                          ),
                          child: Text(
                            _errorMessage,
                            style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: regularFontSize,
                            ),
                          ),
                        ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.08),
                          border:
                              Border.all(color: Colors.blue.shade800, width: 2),
                          color: Colors.blue.shade50,
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          focusNode: _emailFocus,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: regularFontSize),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.02,
                            ),
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: regularFontSize,
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty) _validateEmail(value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!_isValidEmail(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) {
                            _emailFocus.unfocus();
                            FocusScope.of(context).requestFocus(_passwordFocus);
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.08),
                          border:
                              Border.all(color: Colors.blue.shade800, width: 2),
                          color: Colors.blue.shade50,
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          obscureText: _obscurePassword,
                          style: TextStyle(fontSize: regularFontSize),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.02,
                            ),
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: regularFontSize,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.blue.shade800,
                                size: screenWidth * 0.06,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) => _signIn(),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgotPassword');
                          },
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.w500,
                              fontSize: regularFontSize,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      SizedBox(
                        width: double.infinity,
                        height: buttonHeight,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _signIn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.08),
                            ),
                            disabledBackgroundColor: Colors.blue.shade300,
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: buttonFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/register'),
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: regularFontSize,
                            color: Colors.blue.shade800,
                          ),
                        ),
                      )
                    ],
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
