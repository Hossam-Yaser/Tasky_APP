import 'package:flutter/material.dart';
import 'package:tasky_app/screens/appsection/main_screen.dart';
import 'package:tasky_app/screens/auth/login_screen.dart';
import 'package:tasky_app/screens/onboarding.dart';
import 'package:tasky_app/screens/splash_screen.dart';

void main() {
  runApp(const TaskyApp(routeName: SplashScreen.routName));
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key, required this.routeName});
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routName,
      routes: {
        SplashScreen.routName: (context) => const SplashScreen(),
        LoginScreen.routName: (context) => LoginScreen(),
        Onboarding.routeName: (context) => Onboarding(),
        MainScreen.routeName: (context) => MainScreen(),
      },
    );
  }
}
