import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class Geminiwid extends StatefulWidget {
  const Geminiwid({super.key});
  @override
  State<Geminiwid> createState() => _GeminiwidState();
}

class _GeminiwidState extends State<Geminiwid> {
  final Gemini gemini = Gemini.instance;

  ChatUser currentUser = ChatUser(id: '0', firstName: 'User');
  ChatUser geminiUser = ChatUser(id: '1', firstName: 'Gemini');

  List<ChatMessage> messages = [];

  void _sendmessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
        } else {
          String response = event.content?.parts
                  ?.fold("", (previous, current) => "$previous$current") ??
              "";
          ChatMessage message = ChatMessage(
            text: response,
            user: geminiUser,
            createdAt: DateTime.now(),
          );
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      SnackBar(content: Text('Error: $e'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DashChat(
        messageListOptions: const MessageListOptions(),
        inputOptions: const InputOptions(inputDecoration: InputDecoration(hintText: 'Ask me anything...',),
            autocorrect: true, inputMaxLines: 100, maxInputLength: 5000),
        messageOptions: const MessageOptions(
          showTime: true,
        ),
        currentUser: currentUser,
        onSend: _sendmessage,
        messages: messages);
  }
}
