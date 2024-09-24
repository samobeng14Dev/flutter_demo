import 'package:flutter/material.dart';
import 'package:task_manager/utils/todo_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // A list of TO DO tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
  ];

  // checkBoxChanged method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = value; // Toggle task completed status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TO DO"),
        backgroundColor: Colors.yellow,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0], // Task name
            taskCompleted: toDoList[index][1], // Task completed status
            onChanged: (value) => checkBoxChanged(value, index), // Handle checkbox change
          );
        },
      ),
    );
  }
}
