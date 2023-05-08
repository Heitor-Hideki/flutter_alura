import 'package:flutter/cupertino.dart';
import 'package:flutter_alura/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/fluttinho.png', 3),
    Task('Aprender React', 'assets/images/fluttinho.png', 4),
    Task('Aprender Node AAAAAAAAAAAAAAAAAAAAAAAAAAAa',
        'assets/images/fluttinho.png', 5),
    Task('Aprender Node', 'assets/images/Red_%281%29.webp', 4),
    Task('Aprender gragas', 'assets/images/fluttinho.png', 1),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  int userLevel = 0;

  void levelUpUser(int difficulty){
    userLevel+(0.2 * difficulty);
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
