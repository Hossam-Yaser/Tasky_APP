import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_color.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      color: Color(mainColor),
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
