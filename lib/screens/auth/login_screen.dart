// import 'dart:math'; // Removed because log from dart:math is not for logging strings.

import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/core/utils/validator_function.dart';
import 'package:tasky_app/data/firebase/firebase_auth.dart';
import 'package:tasky_app/screens/appsection/main_screen.dart';
import 'package:tasky_app/screens/auth/register_screen.dart';
import 'package:tasky_app/screens/auth/widgets/material_button_widget.dart';
import 'package:tasky_app/screens/auth/widgets/test_rich_widget.dart';
import 'package:tasky_app/screens/auth/widgets/textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userName = TextEditingController();

  final TextEditingController password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 122,
            bottom: 33,
            left: 18,
            right: 24,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "login",
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
                    fontWeight: FontWeight.w300,
                    color: Color(0xff24252C),
                  ),
                ),
                SizedBox(height: 5),
                TextformfieldWidget(
                  hintText: 'Enter email or username',
                  controller: userName,
                  validator: Validator.validateEmail,
                ),
                SizedBox(height: 26),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff24252C),
                  ),
                ),
                SizedBox(height: 5),

                TextformfieldWidget(
                  hintText: "Enter Password",
                  controller: password,
                  validator: Validator.validatePassword,
                ),
                SizedBox(height: 75),

                MaterialButtonWidget(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      AppDialog.showDialogLoading(context);
                      await FirebaseAuthUser.login(
                            userName.text.trim(),
                            password.text.trim(),
                          )
                          .then((value) {
                            debugPrint("Login successful");
                            password.clear();
                            userName.clear();
                            Navigator.of(context).pop();
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(MainScreen.routeName);
                          })
                          .catchError((error) {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Invalid email or password"),
                              ),
                            );
                          });
                    }
                  },
                  title: "Login",
                ),
                SizedBox(height: 246),
                Center(
                  child: TestRichWidget(
                    titel: "Don't have an account?",
                    subTitle: 'Register',
                    onTap: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
