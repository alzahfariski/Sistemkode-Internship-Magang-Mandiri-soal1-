import 'package:flutter/material.dart';
import 'package:frontend_idemusistemsinergi/website/view/home_page.dart';

void main() {
  runApp(const CartridgeKingsApp());
}

class CartridgeKingsApp extends StatelessWidget {
  const CartridgeKingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartridge Kings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}
