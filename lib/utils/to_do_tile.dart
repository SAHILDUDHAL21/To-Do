import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            //Checkbox(value: value, onChanged: onChanged),
            //task name
            Text("sss"),
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 228, 240, 5),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
