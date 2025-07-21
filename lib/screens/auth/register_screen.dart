import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/validator_function.dart';
import 'package:tasky_app/data/firebase/firebase_auth.dart';
import 'package:tasky_app/screens/auth/login_screen.dart';
import 'package:tasky_app/screens/auth/widgets/material_button_widget.dart';
import 'package:tasky_app/screens/auth/widgets/test_rich_widget.dart';
import 'package:tasky_app/screens/auth/widgets/textformfield_widget.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const String routeName = 'RegisterScreen';
  var emial = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 97, left: 18, right: 24),
          child: Form(
            key: formKey,
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
                TextformfieldWidget(
                  hintText: 'Enter email or username',
                  controller: emial,
                  validator: Validator.validateEmail,
                ),
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

                TextformfieldWidget(
                  hintText: "Enter Password",
                  controller: password,
                  validator: Validator.validatePassword,
                ),
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

                TextformfieldWidget(
                  hintText: "Confirm Password",
                  controller: confirmPassword,
                  validator: (text) => Validator.validateConfirmPassword(
                    confirmPassword.text,
                    password.text,
                  ),
                ),
                SizedBox(height: 41),

                MaterialButtonWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseAuthUser.register(
                            emial.text.trim(),
                            password.text.trim(),
                          )
                          .then((value) {
                            emial.clear();
                            password.clear();
                            confirmPassword.clear();
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(LoginScreen.routeName);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Email created successfully"),
                              ),
                            );
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
      ),
    );
  }
}
