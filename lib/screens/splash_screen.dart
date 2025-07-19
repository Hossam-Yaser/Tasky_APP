import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant/assets_constants.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Onboarding.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(mainColor),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeft(
              duration: Duration(seconds: 1),
              child: Image.asset(scale: 0.7, AssetsConstants.taskIcon),
            ),
            BounceInDown(
              from: 50,
              delay: Duration(milliseconds: 800),
              duration: Duration(seconds: 1),
              child: Image.asset(scale: 0.7, AssetsConstants.yIcon),
            ),
          ],
        ),
      ),
    );
  }
}
