import 'package:flutter/material.dart';
import 'package:tasky_app/screens/appsection/main_screen.dart';
import 'package:tasky_app/screens/auth/login_screen.dart';
import 'package:tasky_app/screens/auth/register_screen.dart';
import 'package:tasky_app/screens/onboarding.dart';
import 'package:tasky_app/screens/splash_screen.dart';

void main() {
  runApp(const TaskyApp(routeName: SplashScreen.routeName));
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key, required this.routeName});
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        Onboarding.routeName: (context) => Onboarding(),
        MainScreen.routeName: (context) => MainScreen(),
      },
    );
  }
}
