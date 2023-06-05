import 'package:digital_wallet/view/screens/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Wallet',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(1, 0, 184, 148),
      ),
      home: const AuthScreen(),
    );
  }
}
