import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged),
            //task name
            Text(taskName),
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 155, 155, 155),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
