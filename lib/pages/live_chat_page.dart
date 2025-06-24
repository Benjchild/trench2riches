import 'package:flutter/material.dart';

class LiveChatPage extends StatelessWidget {
  const LiveChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Chat")),
      body: const Center(child: Text("Chat with us!")),
    );
  }
}
