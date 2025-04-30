import 'package:flutter/material.dart';
import 'package:to_do/utils/my_button.dart';

class DailogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback OnCancel;

  DailogBox({
    super.key,
    required this.controller,
    required this.OnCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //GET USER INPUT
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Add a new task',
              ),
            ),

            //BUTTOS SAVE AND CANCEL
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "SAVE", onPressed: onSave),
                MyButton(text: "Cancel", onPressed: OnCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
