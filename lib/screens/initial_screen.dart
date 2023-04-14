import 'package:flutter/material.dart';
import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 1000),
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter',
                'assets/images/fluttinho.png',
                3),
            Task(
                'Aprender React',
                'assets/images/fluttinho.png',
                4),
            Task(
                'Aprender Node AAAAAAAAAAAAAAAAAAAAAAAAAAAa',
                'assets/images/fluttinho.png',
                5),
            Task(
                'Aprender Node',
                'assets/images/Red_%281%29.webp',
                4),
            Task(
                'Aprender gragas',
                'assets/images/fluttinho.png',
                1),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}