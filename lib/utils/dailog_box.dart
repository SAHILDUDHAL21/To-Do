import 'package:flutter/material.dart';
import 'package:to_do/utils/my_button.dart';

// ignore: must_be_immutable
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
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //GET USER INPUT
            TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
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
