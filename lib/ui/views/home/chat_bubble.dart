import 'package:flutter/material.dart';
import 'package:ollama/models/chatbot_model.dart';
import 'package:ollama/utils/helpers.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.message,
    super.key,
  });

  final ChatbotMessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: decContainer(
        allPadding: 10,
        radius: 12,
        color: message.isUser ? const Color(0xff128c7e) : Colors.grey[800],
        child: Text(
          message.isUser ? message.question! : message.fullIaResponseText,
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
