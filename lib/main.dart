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
      title: 'IDDSI App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to respective pages
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        title: const Text(
          "IDDSI App",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          // Dropdown Menu
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.black),
            onSelected: (value) {
              // Handle dropdown selection
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(value: "iddsi", child: Text("What is the IDDSI?")),
              const PopupMenuItem(value: "dysphagia", child: Text("What is Dysphagia?")),
              const PopupMenuItem(value: "symptoms", child: Text("Signs and Symptoms of Dysphagia")),
              const PopupMenuItem(value: "disclaimer", child: Text("Disclaimer")),
            ],
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            "assets/background_img.png",
            fit: BoxFit.cover,
          ),

          // Content Overlay
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Welcome Text
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 1),
                  child: const Text(
                    "Welcome to IDDSI App",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: Colors.black54,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // IDDSI Logo
                Image.asset(
                  "assets/iddsi.logo.jpeg",
                  width: 150,
                  height: 150,
                  color: Colors.lightBlue,
                ),
                const SizedBox(height: 20),

                // Speech Therapist Logo
                Image.asset(
                  "assets/speech.logo.png",
                  width: 150,
                  height: 150,
                  color: Colors.lightBlue,
                ),
                const SizedBox(height: 30),

                // Subtitle
                const Text(
                  "Helping You Navigate Dysphagia Safely",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.black54,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Levels",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: "Therapists",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: "Questions",
          ),
        ],
      ),
    );
  }
}

