import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_list.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskList>(
      create: (context) => TaskList(),
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
