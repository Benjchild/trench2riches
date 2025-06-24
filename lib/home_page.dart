import 'package:flutter/material.dart';

import 'live_chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  final packageKey = GlobalKey();
  bool showMenu = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == 'scrollToPackages') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToPackageSection();
      });
    }
  }

  void _scrollToPackageSection() {
    if (packageKey.currentContext != null) {
      Scrollable.ensureVisible(
        packageKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _toggleMenu() {
    setState(() => showMenu = !showMenu);
  }

  void _navigateToCreditRepair() {
    setState(() => showMenu = false);
    Navigator.pushNamed(context, '/credit-repair');
  }

  void _navigateToPackages() {
    setState(() => showMenu = false);
    Navigator.pushReplacementNamed(context, '/', arguments: 'scrollToPackages');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F1FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEE7F00),
        title: const Text(
          'LIMITED TIME OFFER',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: _toggleMenu,
          ),
        ],
      ),
      body: Stack(
        children: [
          _buildMainContent(),
          if (showMenu) _buildFullScreenMenu(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LiveChatPage()),
          );
        },
        label: const Text("Let's Chat!"),
        icon: const Icon(Icons.chat_bubble),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Widget _buildMainContent() {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'TRENCHES 2 RICHES',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Unlock the full potential of your financial\n'
          'future with our expert credit solutions for\n'
          'SUCCESS!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _scrollToPackageSection,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Check Available Packages'),
        ),
        const SizedBox(height: 30),
        const Divider(thickness: 2),
        Container(
          key: packageKey,
          child: Column(
            children: [
              const Text(
                'CHOOSE YOUR PACKAGE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/banner.png', height: 220),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('REPAIR PACKAGE',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text('\$1000.00',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                    const Text('OR\n4 PAYMENTS OF \$250.00',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.green)),
                    const SizedBox(height: 10),
                    const Text(
                      '✔ Remove All Negative Items\n'
                      '✔ Get Approved For Higher Limit Cards\n'
                      '✔ Purchase Your Dream Home Or Luxury Vehicle',
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/payment');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('SECURE YOUR PACKAGE'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFullScreenMenu() {
    return Container(
      color: Colors.orange,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _navigateToCreditRepair,
                  child: const Text(
                    'Credit Repair',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: _navigateToPackages,
                  child: const Text(
                    'Packages',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, size: 30, color: Colors.white),
              onPressed: _toggleMenu,
            ),
          ),
        ],
      ),
    );
  }
}
