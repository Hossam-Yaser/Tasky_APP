import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/screens/appsection/widgets/container_priority_widget.dart';
import 'package:tasky_app/screens/appsection/widgets/custom_material_button.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({super.key});

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  final List<int> indexData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 28,
        children: [
          Text(
            "Task Priority",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff24252C),
            ),
          ),
          Divider(thickness: 2),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: indexData.map((index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: ContainerPriorityWidget(
                  index: index,
                  isSelected: selectedIndex == index,
                ),
              );
            }).toList(),
          ),
          Row(
            spacing: 15,
            children: [
              Expanded(
                child: CustomMaterialButton(
                  title: "Cancel",
                  titleColor: Color(mainColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: CustomMaterialButton(
                  onPressed: () {
                    Navigator.pop(context, selectedIndex);
                  },
                  title: "Save",
                  titleColor: Colors.white,
                  buttonColor: Color(mainColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
