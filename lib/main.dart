import 'package:flutter/material.dart';
import 'package:tasky_app/screens/appsection/main_screen.dart';
import 'package:tasky_app/screens/auth/login_screen.dart';
import 'package:tasky_app/screens/auth/register_screen.dart';
import 'package:tasky_app/screens/onboarding.dart';
import 'package:tasky_app/screens/onboarding_preferances.dart';
import 'package:tasky_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final hasSeenOnboarding = await OnboardingPreferences.getHasSeenOnboarding();
  final startRoute = hasSeenOnboarding
      ? LoginScreen.routeName
      : Onboarding.routeName;

  runApp(TaskyApp(routeName: startRoute));
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
