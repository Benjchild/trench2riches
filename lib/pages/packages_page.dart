import 'package:flutter/material.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Packages'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text(
          'Explore our financial growth packages!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
