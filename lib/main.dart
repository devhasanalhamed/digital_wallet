import 'package:digital_wallet/controller/app_structure_provider.dart';
import 'package:digital_wallet/view/screens/auth_screen.dart';
import 'package:digital_wallet/view/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/auth_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AppStructure(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, ch) => MaterialApp(
          title: 'My Wallet',
          theme: ThemeData(
              fontFamily: 'Tajawal',
              primaryColor: const Color.fromARGB(1, 0, 184, 148),
              colorScheme: const ColorScheme.light(
                primary: Color.fromARGB(255, 10, 75, 149),
                secondary: Color.fromARGB(255, 0, 212, 112),
                background: Color.fromARGB(255, 243, 243, 243),
              )),
          // home: auth.isAuth ? HomePage() : const AuthScreen(),
          home: const HomePage(),
        ),
      ),
    );
  }
}
