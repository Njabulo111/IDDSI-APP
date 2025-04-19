import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // Import scheduler

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _showWelcomeScreen = true;
  final ScrollController _scrollController = ScrollController();

  // IDDSI quick option topics
  final List<String> _quickOptions = [
    'IDDSI Framework Levels',
    'Food Testing Methods',
    'Dysphagia Information',
    'Level 0 - Thin',
    'Level 4 - Pureed',
    'Level 7 - Regular',
    'Thickening Liquids',
    'My Food Recommendations'
  ];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    final userMessage = _controller.text;
    _controller.clear();

    setState(() {
      _messages.add({
        'message': userMessage,
        'isUser': true,
      });
    });

    // Simulate delay for bot response (feels more natural)
    Future.delayed(const Duration(milliseconds: 300), () {
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          // Add bot response
          _messages.add({
            'message':
                "Thank you for your question about IDDSI. Let me help you with information about $userMessage",
            'isUser': false,
          });
          // Use Scheduler to ensure scroll happens after build
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _scrollToBottom();
          });
        });
      });
    });
  }

  void _sendQuickOption(String option) {
    setState(() {
      _messages.add({
        'message': option,
        'isUser': true,
      });
    });

    // Simulate delay for bot response
    Future.delayed(const Duration(milliseconds: 300), () {
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          // Add bot response
          _messages.add({
            'message':
                "Here's information about $option. The detailed response will come from the chatbot backend.",
            'isUser': false,
          });
          // Use Scheduler to ensure scroll happens after build
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _scrollToBottom();
          });
        });
      });
    });
  }

  void _startChat() {
    setState(() {
      _showWelcomeScreen = false;
      _messages.add({
        'message':
            "Hello! I'm Masibonge. How can I assist you with IDDSI framework or dysphagia questions today?",
        'isUser': false,
      });
    });
  }

  void _scrollToBottom() {
    print("Has Clients: ${_scrollController.hasClients}");
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Close chatbot action here
            Navigator.of(context).pop();
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Image.asset(
            'assets/iddsi-logo.png',
            fit: BoxFit.contain, // Changed to contain to preserve aspect ratio
            height: 80,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60, // Increased height to accommodate logo
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
            opacity: 0.3, // Lower this if the background is too subtle
          ),
        ),
        child: _showWelcomeScreen ? _buildWelcomeScreen() : _buildChatScreen(),
      ),
    );
  }

  Widget _buildWelcomeScreen() {
    return Container(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.smart_toy_rounded, // Better chatbot icon
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Masibonge",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Hi, I am Masibonge, IDDSI's digital assistant. You can ask me questions about dysphagia, IDDSI framework, food testing methods, and food recommendations.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Before we begin, please note:",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DISCLAIMER:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "This chatbot is designed to provide general information about the International Dysphagia Diet Standardisation Initiative (IDDSI) framework, food libraries, and dysphagia-related guidance. The information shared is based on recommendations from qualified speech therapists and the official IDDSI website (www.iddsi.org).",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Important:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "This chatbot does not diagnose medical conditions or offer personalized medical advice.\n"
                    "The content provided is for informational purposes only and should not be used as a substitute for professional medical consultation, diagnosis, or treatment.\n"
                    "Only a qualified speech therapist or healthcare professional can assess and determine your appropriate IDDSI level and dietary needs.\n"
                    "Always consult your healthcare provider before making decisions related to dysphagia management or modifying your diet.\n"
                    "Use of this chatbot does not create a therapist-patient relationship, and the developers or associated institutions assume no liability for how the information is used.",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "I can communicate in all South African languages, so feel free to ask questions in your preferred language.",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "By clicking 'Start the chat', you acknowledge that you have read and agreed to the above disclaimer.",
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _startChat,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Start the chat",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildChatScreen() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            key: UniqueKey(),
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: _messages.length +
                (_messages.isNotEmpty && _messages.first['isUser'] == false
                    ? 1
                    : 0),
            itemBuilder: (context, index) {
              if (_messages.isNotEmpty &&
                  index == 1 &&
                  _messages.first['isUser'] == false) {
                return _buildQuickOptionsSection();
              } else {
                final adjustedIndex =
                    _messages.isNotEmpty && _messages.first['isUser'] == false && index > 1
                        ? index - 1
                        : index;
                if (adjustedIndex < _messages.length) {
                  return _buildMessageBubble(_messages[adjustedIndex]);
                } else {
                  return const SizedBox.shrink();
                }
              }
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.shade300),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Write a message...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.sentiment_satisfied_alt,
                    color: Colors.grey),
                onPressed: () {
                  // Emoji picker or similar functionality could go here
                },
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.blue),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickOptionsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 8),
            child: Text(
              "Please select an option or feel free to ask any questions.",
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _quickOptions.map((option) {
              return InkWell(
                onTap: () => _sendQuickOption(option),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade300),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(color: Colors.blue.shade700),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final isUser = message['isUser'] as bool;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser)
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.smart_toy_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            decoration: BoxDecoration(
              color: isUser ? Colors.blue : Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Text(
              message['message'],
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IDDSIChatbotApp extends StatelessWidget {
  const IDDSIChatbotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
        ),
      ),
      home: const ChatbotPage(),
    );
  }
}

void main() {
  runApp(const IDDSIChatbotApp());
}
