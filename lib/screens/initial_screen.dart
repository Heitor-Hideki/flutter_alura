import 'package:flutter/material.dart';
import 'package:flutter_alura/components/task.dart';
import 'package:flutter_alura/data/task_inherited.dart';
import 'package:flutter_alura/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  InitialScreen({Key? key}) : super(key: key);

  double userLevel = 0;

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  double calcUserLevel() {
    double level = 0;
    for (Task task in TaskInherited.of(context).taskList) {
      level += (task.level * task.difficulty) / 10;
    }

    return widget.userLevel = double.parse(level.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tarefas'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 170,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: widget.userLevel/100,
                  ),
                ),
                Text(
                  'Level ${widget.userLevel}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              calcUserLevel();
            });
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(taskContext: context)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
