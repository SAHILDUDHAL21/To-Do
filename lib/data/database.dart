import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  //defult list
  List toDoList = [];

  //hive referance
  final _myBox = Hive.box("mytodo");

  //very first timr he app open kelya var default data
  void createInitialData() {
    toDoList = [
      ['Welcome to To Do app', false],
      ['Add todo', false],
      ['Track Your Progress', false],
      ['Make a video', false],
    ];
    updateData();
  }

  //load data
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update data
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
