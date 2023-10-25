import 'package:darkempath/data/chat/chat_data.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  // Load Fake Chat Data
  List<Map<String, dynamic>> chatData = ChatData().chat;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: []
      ),
    );
  }
}