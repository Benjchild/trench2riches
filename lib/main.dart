import 'package:flutter/material.dart';

import 'home_page.dart';
import 'pages/credit_repair_page.dart';
import 'pages/packages_page.dart';
import 'payment_page.dart';

void main() {
  runApp(const Trench2RichesApp());
}

class Trench2RichesApp extends StatelessWidget {
  const Trench2RichesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trenches 2 Riches',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/payment': (context) => const PaymentPage(),
        '/credit-repair': (context) => CreditRepairPage(
              onBookPackage: () => Navigator.pushNamed(context, '/'),
            ),
        '/packages': (context) => const PackagesPage(),
      },
    );
  }
}
