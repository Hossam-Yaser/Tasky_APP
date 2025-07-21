import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/core/constant/assets_constants.dart';
import 'package:tasky_app/screens/appsection/widgets/alert_dialog_widget.dart';
import 'package:tasky_app/screens/auth/widgets/textformfield_widget.dart';

class ShowAddTaskModal extends StatelessWidget {
  const ShowAddTaskModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
          ),
          width: double.infinity,
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 17,
            horizontal: 25,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff24252C),
                ),
              ),
              SizedBox(height: 14),
              TextformfieldWidget(hintText: "Do math homework"),
              SizedBox(height: 14),
              Text(
                'Description',
                style: TextStyle(
                  color: Color(0xff6E6A7C),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 14),
              TextformfieldWidget(hintText: "Add description"),
              SizedBox(height: 14),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(),
                      );
                    },
                    child: SvgPicture.asset(AssetsConstants.timerIcon),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialogWidget(),
                      );
                    },
                    child: SvgPicture.asset(AssetsConstants.flagIcon),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(AssetsConstants.sendIcon),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
