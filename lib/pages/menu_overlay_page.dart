import 'package:flutter/material.dart';

class MenuOverlayPage extends StatelessWidget {
  final VoidCallback onItemSelected;

  const MenuOverlayPage({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'Credit Repair',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Packages',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
                onItemSelected();
              },
            ),
          ],
        ),
      ),
    );
  }
}
