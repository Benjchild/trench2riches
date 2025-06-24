import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null && mounted) {
      setState(() => _selectedImage = File(picked.path));
    }
  }

  void _submitProof() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Proof submitted!")),
    );
  }

  void _showCashAppDialog() {
    const tag = '\$vivekwihangana';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('CashApp Tag'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Copy the CashApp Tag below:'),
            const SizedBox(height: 10),
            SelectableText(tag,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Clipboard.setData(const ClipboardData(text: tag));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("CashApp tag copied!")),
                );
              },
              icon: const Icon(Icons.copy),
              label: const Text('Copy Tag'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }

  void _showQRDialog(String imagePath, String address) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, height: 200),
            const SizedBox(height: 10),
            const Text("Payment Address:"),
            const SizedBox(height: 5),
            SelectableText(
              address,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: address));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Address copied!")),
                );
              },
              icon: const Icon(Icons.copy),
              label: const Text('Copy Address'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String label,
    required String imageAsset,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset(imageAsset, height: 40),
                const SizedBox(height: 10),
                Text(label,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    textAlign: TextAlign.center),
                const SizedBox(height: 6),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F1FF),
      appBar: AppBar(
        title: const Text('Secure Your Payment'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              'Payment Options',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // First row
            Row(
              children: [
                _buildCard(
                  label: '\$vivekwihangana',
                  imageAsset: 'assets/cashapp.png',
                  subtitle: 'Send via CashApp',
                  onTap: _showCashAppDialog,
                ),
                const SizedBox(width: 12),
                _buildCard(
                  label: '3FZbgi29cpjq2GjdwV8eyHuJJnkLtktZc5',
                  imageAsset: 'assets/Bitcoin.png',
                  subtitle: 'Send via Bitcoin',
                  onTap: () => _showQRDialog(
                    'assets/Bitcoin_QR.png',
                    '3FZbgi29cpjq2GjdwV8eyHuJJnkLtktZc5',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Second row
            Row(
              children: [
                _buildCard(
                  label: 'LLitVYzgGZNLsCKSJP1qYMj2',
                  imageAsset: 'assets/Litcoin.png',
                  subtitle: 'Send via Litecoin',
                  onTap: () => _showQRDialog(
                    'assets/Litecoin_QR.png',
                    'LLitVYzgGZNLsCKSJP1qYMj2',
                  ),
                ),
                const SizedBox(width: 12),
                _buildCard(
                  label: 'TNRvC5vPYBfzD6qP2LobGmZ1tF',
                  imageAsset: 'assets/Usdt.png',
                  subtitle: 'Send via USDT (TRC20)',
                  onTap: () => _showQRDialog(
                    'assets/Usdt_QR.png',
                    'TNRvC5vPYBfzD6qP2LobGmZ1tF',
                  ),
                ),
              ],
            ),

            const Divider(height: 40),
            const Text(
              '📩 After payment, please send your proof of payment to:',
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'childbenj@gmail.com',
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.upload),
              label: const Text('Upload Payment Proof'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              ),
            ),

            if (_selectedImage != null) ...[
              const SizedBox(height: 20),
              Image.file(_selectedImage!, height: 200),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitProof,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                ),
                child: const Text('Submit Proof via Email'),
              ),
            ],

            const SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
