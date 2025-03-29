import 'package:flutter/material.dart';

void main() {
  runApp(const IDDSIApp());
}

class IDDSIApp extends StatelessWidget {
  const IDDSIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IDDSIHomePage(),
    );
  }
}

class IDDSIHomePage extends StatefulWidget {
  @override
  _IDDSIHomePageState createState() => _IDDSIHomePageState();
}

class _IDDSIHomePageState extends State<IDDSIHomePage> {
  bool isMenuOpen = false;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/iddsi-logo.jpeg'),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isMenuOpen ? Icons.close : Icons.menu,
              color: Colors.black,
            ),
            onPressed: toggleMenu,
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/speech.logo.png',
                  height: 120,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to the IDDSI App',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C7378),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Helping you navigate dysphagia safely',
                  style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 128, 171, 137)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F41BB),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'CONTINUE',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Therapist Login',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1F41BB),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isMenuOpen)
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                color: Colors.white.withOpacity(0.95),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Image.asset('assets/iddsi-logo.jpeg', height: 50),
                    const SizedBox(height: 20),
                    _menuItem("What is the IDDSI", Icons.info),
                    _menuItem("What is Dysphagia", Icons.qr_code),
                    _menuItem("Signs and Symptoms", Icons.health_and_safety),
                    _menuItem("Disclaimer", Icons.warning),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F41BB),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Contact Us',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _menuItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const Spacer(),
          const Icon(Icons.arrow_forward, color: Colors.blue),
        ],
      ),
    );
  }
}
