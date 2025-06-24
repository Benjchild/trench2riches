import 'package:flutter/material.dart';

class LiveChatPage extends StatelessWidget {
  const LiveChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Chat'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text(
          'Live Chat Interface Coming Soon',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
