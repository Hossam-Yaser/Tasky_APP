import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(mainColor));
  }
}
