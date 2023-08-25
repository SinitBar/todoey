import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    super.key,
    required this.title,
    required this.checkCallback,
    required this.deleteTask,
    this.isChecked = false,
  });

  final String title;
  final bool isChecked;
  final Function checkCallback;
  final Function deleteTask;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.confirm,
            title: 'Delete task "$title"?',
            confirmBtnColor: Colors.lightBlueAccent,
            onConfirmBtnTap: () {
              deleteTask();
            });
      },
      child: CheckboxListTile(
        value: isChecked,
        onChanged: (state) {
          checkCallback(state);
        },
        title: Text(
          title,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}
