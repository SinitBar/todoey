import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/task_list.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: kBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 150.0, left: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add task',
                textAlign: TextAlign.center,
                style: kTextAddTaskScreen,
              ),
              TextField(
                autofocus: true,
                cursorColor: Colors.lightBlueAccent,
                //decoration: InputDecoration(),
                controller: _controller,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.lightBlueAccent),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => const EdgeInsets.all(8.0)),
                  ),
                  onPressed: () {
                    //addTaskCallback(_controller.text);
                    Provider.of<TaskList>(context, listen: false)
                        .addTask(_controller.text);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
