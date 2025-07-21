import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/core/constant/assets_constants.dart';
import 'package:tasky_app/core/utils/app_color.dart';

class ContainerPriorityWidget extends StatelessWidget {
  const ContainerPriorityWidget({
    super.key,
    required this.index,
    this.isSelected = false,
  });
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 58,
      decoration: BoxDecoration(
        color: !isSelected ? null : Color(mainColor),
        borderRadius: BorderRadius.circular(6),
        border: isSelected
            ? null
            : Border.all(color: Color(0xff6E6A7C), width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsConstants.flagIcon,
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.white : Color(mainColor),
              BlendMode.srcIn,
            ),
          ),
          Text(
            '$index',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.white : Color(0xff24252C),
            ),
          ),
        ],
      ),
    );
  }
}
