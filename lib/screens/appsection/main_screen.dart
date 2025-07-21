import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant/assets_constants.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/screens/appsection/widgets/show_add_task_modal.dart';
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
              SizedBox(height: 15),
              // EmptyScreen(),
              HomeScreenTextFormField(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => ShowAddTaskModal(),
          );
        },
        child: Image.asset(AssetsConstants.addButtonIcon),
      ),
    );
  }
}

class HomeScreenTextFormField extends StatelessWidget {
  const HomeScreenTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: Image.asset(AssetsConstants.searchIcon, width: 24, height: 24),
        ),
        hintText: "Search for your task...",
        hintStyle: TextStyle(
          color: Color(0xff7F7F7F),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(mainColor)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
