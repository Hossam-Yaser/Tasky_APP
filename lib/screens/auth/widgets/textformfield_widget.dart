import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_color.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget({
    super.key,
    required this.hintText,
    this.controller,
  });
  final String hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
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
      ),
    );
  }
}
