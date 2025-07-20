import 'package:flutter/material.dart';
import 'package:tasky_app/screens/auth/login_screen.dart';
import 'package:tasky_app/screens/auth/widgets/material_button_widget.dart';
import 'package:tasky_app/screens/auth/widgets/test_rich_widget.dart';
import 'package:tasky_app/screens/auth/widgets/textformfield_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 97, left: 18, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 53),
              Text(
                "Username",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff24252C),
                ),
              ),
              SizedBox(height: 5),
              TextformfieldWidget(hintText: 'Enter email or username'),
              SizedBox(height: 26),
              Text(
                "Enter New Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff24252C),
                ),
              ),
              SizedBox(height: 5),

              TextformfieldWidget(hintText: "Enter Password"),
              SizedBox(height: 26),
              Text(
                "Confirm Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff24252C),
                ),
              ),
              SizedBox(height: 5),

              TextformfieldWidget(hintText: "Confirm Password"),
              SizedBox(height: 41),

              MaterialButtonWidget(
                onPressed: () {
                  Navigator.of(context).pop(LoginScreen.routeName);
                },
                title: "Register",
              ),
              SizedBox(height: 225),
              Center(
                child: TestRichWidget(
                  titel: "Already have an account? ",
                  subTitle: 'Login',
                  onTap: () {
                    Navigator.of(context).pop(LoginScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
