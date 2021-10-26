import 'package:baru/models/task.dart';
import 'package:flutter/foundation.dart'; // meyediakan ChangeNotifier, dimain kita harus import provider kalau diluar main cukup gunakan foundation
import 'dart:collection'; //menyediakan UnmodifiableListView

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Example 1'),
    Task(name: 'Example 2'),
  ];

  // karena _tasks private maka untuk dapat di ambil dari luar class diperlukan codes berikut
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  // checkbox ya, bukan update tasknya, kurang tepat namanya sbrnya
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
