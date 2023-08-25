import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/to_do_item.dart';
import 'package:todoey/models/task_list.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskList>(
      builder: (context, taskList, _) => ListView.builder(
        itemBuilder: (context, index) {
          return ToDoItem(
              title: taskList[index].name,
              isChecked: taskList[index].isDone,
              checkCallback: (value) {
                taskList.checkChange(value, index);
              },
              deleteTask: () {
                taskList.deleteTask(index);
              });
        },
        itemCount: taskList.length,
      ),
    );
  }
}
