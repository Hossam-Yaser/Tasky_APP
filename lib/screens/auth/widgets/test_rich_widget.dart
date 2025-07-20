import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_color.dart';

class TestRichWidget extends StatelessWidget {
  const TestRichWidget({
    super.key,
    required this.titel,
    required this.subTitle,
    this.onTap,
  });
  final String titel;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: titel),
            TextSpan(
              text: subTitle,
              style: TextStyle(color: Color(mainColor)),
            ),
          ],
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color(0xff6E6A7C),
          ),
        ),
      ),
    );
  }
}
