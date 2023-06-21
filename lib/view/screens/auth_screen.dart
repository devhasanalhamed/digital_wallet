import 'package:digital_wallet/view/widgets/Login_widget.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = 'auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return  LoginWidget();
  }
}
