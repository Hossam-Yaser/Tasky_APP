import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/core/constant/assets_constants.dart';
import 'package:tasky_app/screens/appsection/widgets/alert_dialog_widget.dart';
import 'package:tasky_app/screens/auth/widgets/textformfield_widget.dart';

class ShowAddTaskModal extends StatefulWidget {
  const ShowAddTaskModal({super.key});

  @override
  State<ShowAddTaskModal> createState() => _ShowAddTaskModalState();
}

class _ShowAddTaskModalState extends State<ShowAddTaskModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _selectedDateTime;

  Future<void> _pickDateTime(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate == null) return;

    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime == null) return;

    setState(() {
      _selectedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );
    });
  }

  void _submitTask() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty || _selectedDateTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields and pick a time")),
      );
      return;
    }

    // You can pass this to your task manager, database, etc.
    print('Task Title: $title');
    print('Description: $description');
    print('Reminder Time: $_selectedDateTime');

    Navigator.pop(context); // Close modal after saving

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Task saved successfully!")));
  }

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
          padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff24252C),
                ),
              ),
              const SizedBox(height: 14),
              TextformfieldWidget(
                hintText: "Do math homework",
                controller: _titleController,
              ),
              const SizedBox(height: 14),
              const Text(
                'Description',
                style: TextStyle(
                  color: Color(0xff6E6A7C),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 14),
              TextformfieldWidget(
                hintText: "Add description",
                controller: _descriptionController,
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _pickDateTime(context),
                    child: SvgPicture.asset(AssetsConstants.timerIcon),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) =>
                            AlertDialogWidget(),
                      );
                    },
                    child: SvgPicture.asset(AssetsConstants.flagIcon),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _submitTask,
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
