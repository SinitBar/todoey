import 'package:flutter/cupertino.dart';
import 'package:todoey/models/task.dart';

class TaskList extends ChangeNotifier {
  final List<Task> _taskList = [];

  Task operator [](int index) {
    return _taskList[index];
  }

  int get length => _taskList.length;

  void checkChange(bool checkValue, int index) {
    _taskList[index].changeState(checkValue);
    notifyListeners();
  }

  void addTask(String taskText) {
    _taskList.add(Task(name: taskText));
    notifyListeners();
  }

  void deleteTask(int index) {
    if (_taskList.length > index) {
      _taskList.removeAt(index);
      notifyListeners();
    }
    // maybe throw error
  }
}
