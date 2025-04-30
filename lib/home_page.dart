import 'package:flutter/material.dart';
import 'package:to_do/utils/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          'To Do ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 146, 146, 143),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ToDoTile(
            taskName: 'Task 1',
            taskCompleted: false,
            onChanged: (p0) {},
          ),
          ToDoTile(taskName: 'Task 2', taskCompleted: true, onChanged: (p0) {}),
        ],
      ),
    );
  }
}
