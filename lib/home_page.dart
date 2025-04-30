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
      backgroundColor: Color.fromARGB(255, 210, 196, 75),
      appBar: AppBar(
        title: const Text(
          'To Do ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 228, 240, 5),
        elevation: 0,
      ),
      body: ListView(children: [ToDoTile()]),
    );
  }
}
