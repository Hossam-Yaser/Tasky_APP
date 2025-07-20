import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant/assets_constants.dart';
import 'package:tasky_app/screens/auth/login_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String routeName = "MainScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AssetsConstants.taskyyIcon, scale: 0.7),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: Image.asset(AssetsConstants.logoutIcon, scale: 0.7),
                  ),
                ],
              ),
              SizedBox(height: 93),
              Image.asset(AssetsConstants.mainScreen),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'What do you want to do today?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff24252C),
                  ),
                ),
              ),
              Text(
                'Tap + to add your tasks',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff24252C),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        child: Image.asset(AssetsConstants.addButtonIcon),
      ),
    );
  }
}
