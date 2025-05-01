import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/utils/dailog_box.dart';
import 'package:to_do/utils/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  //hive
  final _mybox = Hive.box("mytodo");
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    //if this is the first time opening app
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  //text controller
  final controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //saving new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //create task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DailogBox(
          controller: controller,
          onSave: saveNewTask,
          OnCancel: () {
            Navigator.of(context).pop();
            controller.clear();
          },
        );
      },
    );
  }

  //delete(
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: RichText(
          textScaler: TextScaler.linear(1.7),
          text: TextSpan(
            text: "To",
            style: TextStyle(
              fontFamily: "MyFont",
              color: Color.fromARGB(255, 237, 210, 202),
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
            children: [
              TextSpan(
                text: " Do",
                style: TextStyle(
                  fontFamily: "MyFont",
                  color: Color.fromARGB(255, 230, 166, 145),
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        elevation: 0,
      ),
      drawer: Drawer(
        //semanticLabel: "A B O U T",
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        child: Column(
          children: [
            SizedBox(height: 200),
            Icon(Icons.account_circle, color: Colors.white, size: 50),
            //Image.asset('assets/icon/icona.png', height: 20, width: 20),
            Text(
              "To Do User",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontFamily: "MyFont",
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50),
            Text("- Add Tasks", style: TextStyle(color: Colors.white)),
            Text("- Complete It", style: TextStyle(color: Colors.white)),
            Text(
              "- Remove Unwanted Tasks",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "- Never Forget Important Tasks",
              style: TextStyle(color: Colors.white),
            ),

            SizedBox(height: 300),
            Text(
              "Developer : Sahil Dudhal",
              style: TextStyle(color: Colors.white),
            ),
            Text("Twitter: @sahild1311", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        onPressed: createNewTask,
        child: Icon(Icons.add, color: Color.fromARGB(255, 198, 139, 119)),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
