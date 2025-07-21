import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant/assets_constants.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
    );
  }
}
