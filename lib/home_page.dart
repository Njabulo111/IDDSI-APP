import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'menu_item.dart';

class IDDSIHomePage extends StatefulWidget {
  const IDDSIHomePage({super.key});

  @override
  _IDDSIHomePageState createState() => _IDDSIHomePageState();
}

class _IDDSIHomePageState extends State<IDDSIHomePage> {
  bool isMenuOpen = false;
  String? selectedMenuItemTitle;
  String selectedMenuItemContent = '';
  String? selectedMenuItemSvgPath;
  String? selectedMenuItemArrowPath;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
      if (!isMenuOpen) {
        selectedMenuItemTitle = null;
        selectedMenuItemContent = '';
        selectedMenuItemSvgPath = null;
        selectedMenuItemArrowPath = null;
      }
    });
  }

  void selectMenuItem(String title, String content, String svgPath, String arrowPath) {
    setState(() {
      if (selectedMenuItemTitle == title) {
        selectedMenuItemTitle = null;
        selectedMenuItemContent = '';
        selectedMenuItemSvgPath = null;
        selectedMenuItemArrowPath = null;
      } else {
        selectedMenuItemTitle = title;
        selectedMenuItemContent = content;
        selectedMenuItemSvgPath = svgPath;
        selectedMenuItemArrowPath = arrowPath;
      }
      isMenuOpen = true;
    });
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
            onPressed: toggleMenu,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Home Page Background (using FittedBox and errorBuilder)
          Positioned.fill(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/background.png',
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading background image: $error');
                  return Container(
                    color: Colors.grey[200], // Show a grey background if image fails
                    child: const Center(
                      child: Text('Image load failed'),
                    ),
                  );
                },
              ),
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenSize.height * 0.25,
                  child: Image.asset(
                    'assets/speech.logo.png',
                    fit: BoxFit.contain,
                  ),
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
                    onPressed: () {
                      // Continue button functionality
                    },
                    child: const Text(
                      'CONTINUE',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/therapist-login');
                    },
                    child: const Text(
                      'Therapist Login',
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
          // Side Menu - Adjusted to slide in from the left
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isMenuOpen ? 0 : -screenSize.width * 0.7,
            top: 0,
            child: Container(
              width: screenSize.width * 0.7,
              height: screenSize.height,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.97),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(3, 0),
                  ),
                ],
              ),
              child: selectedMenuItemTitle == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                'assets/x_icon.svg',
                                width: 24,
                                height: 24,
                              ),
                              onPressed: toggleMenu,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                MenuItem(
                                  title: "What is the IDDSI",
                                  svgPath: 'assets/info_icon.svg',
                                  arrowPath: 'assets/arrow_icon.svg',
                                  onTap: () {
                                    selectMenuItem("What is the IDDSI",
                                        "Information about IDDSI", 'assets/info_icon.svg', 'assets/arrow_icon.svg');
                                  },
                                ),
                                const Divider(height: 1, thickness: 0.5),
                                MenuItem(
                                  title: "What is Dysphagia",
                                  svgPath: 'assets/dysphagia_icon.svg',
                                  arrowPath: 'assets/arrow_icon.svg',
                                  onTap: () {
                                    selectMenuItem("What is Dysphagia",
                                        "Information about Dysphagia", 'assets/dysphagia_icon.svg', 'assets/arrow_icon.svg');
                                  },
                                ),
                                const Divider(height: 1, thickness: 0.5),
                                MenuItem(
                                  title: "Signs and Symptoms",
                                  svgPath: 'assets/symptoms_icon.svg',
                                  arrowPath: 'assets/arrow_icon.svg',
                                  onTap: () {
                                    selectMenuItem("Signs and Symptoms",
                                        "Information about Signs and Symptoms", 'assets/symptoms_icon.svg', 'assets/arrow_icon.svg');
                                  },
                                ),
                                const Divider(height: 1, thickness: 0.5),
                                MenuItem(
                                  title: "Disclaimer",
                                  svgPath: 'assets/disclaimer_icon.svg',
                                  arrowPath: 'assets/arrow_icon.svg',
                                  onTap: () {
                                    selectMenuItem("Disclaimer",
                                        "Information about Disclaimer", 'assets/disclaimer_icon.svg', 'assets/arrow_icon.svg');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1F41BB),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 4,
                              ),
                              onPressed: () {
                                // Contact us functionality
                              },
                              child: const Text(
                                'Contact Us',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                'assets/x_icon.svg',
                                width: 24,
                                height: 24,
                              ),
                              onPressed: toggleMenu,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              SvgPicture.asset(selectedMenuItemSvgPath!),
                              const SizedBox(width: 8),
                              Text(
                                selectedMenuItemTitle!,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              SvgPicture.asset(selectedMenuItemArrowPath!),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(selectedMenuItemContent),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}