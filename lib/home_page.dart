import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'chatbot.dart';
import 'search_page.dart';

class IDDSIHomePage extends StatefulWidget {
  const IDDSIHomePage({super.key});

  @override
  _IDDSIHomePageState createState() => _IDDSIHomePageState();
}

class _IDDSIHomePageState extends State<IDDSIHomePage> {
  bool showDisclaimer = true;
  int _currentIndex = 1;

  void _closeDisclaimer() {
    setState(() {
      showDisclaimer = false;
    });
  }

  void _showDisclaimer() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Disclaimer'),
          content: const Text(
            'This application is intended as a guide only and should not replace professional medical advice. '
            'Always consult with healthcare professionals for specific dietary and swallowing recommendations.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHomeContent(Size screenSize, double appBarHeight) {
    return Stack(
      children: [
        Positioned.fill(
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              'assets/background.png',
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: const Center(child: Text('Image load failed')),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize.height * 0.25,
                child: Image.asset('assets/speech.logo.png'),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Welcome to the IDDSI App',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C7378),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Helping you navigate dysphagia safely',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 128, 171, 137)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F41BB),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _closeDisclaimer,
                  child: const Text(
                    'CONTINUE',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (showDisclaimer)
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: _showDisclaimer,
                    child: const Text(
                      'Disclaimer',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1F41BB),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatbotPage()),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Let us chat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: appBarHeight * 1.3,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            width: screenSize.width * 0.3,
            child: Image.asset(
              'assets/iddsi-logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        leadingWidth: screenSize.width * 0.3,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/menu_icon.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {}, // Optional menu
          ),
        ],
      ),
      body: _currentIndex == 0
          ? const SearchPage()
          : _buildHomeContent(screenSize, appBarHeight),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}