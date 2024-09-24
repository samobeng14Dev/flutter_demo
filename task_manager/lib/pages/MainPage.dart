import 'dart:convert'; // Needed for encoding/decoding data
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/utils/dialog_box.dart';
import 'package:task_manager/utils/todo_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Controller for the input field
  final _controller = TextEditingController();

  // List to store tasks
  List toDoList = [];

  @override
  void initState() {
    super.initState();
    // Load saved tasks when the app starts
    loadData();
  }

  // Method to save the list of tasks to shared_preferences
  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('toDoList', jsonEncode(toDoList)); // Save as a string
  }

  // Method to load tasks from shared_preferences
  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedList = prefs.getString('toDoList');
    if (savedList != null) {
      setState(() {
        toDoList = jsonDecode(savedList);
      });
    }
  }

  // Method to toggle task completion
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = value; // Update task completed status
    });
    saveData(); // Save updated list
  }

  // Method to save a new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]); // Add new task
      _controller.clear(); // Clear input field
    });
    Navigator.of(context).pop(); // Close dialog
    saveData(); // Save updated list
  }

  // Method to create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.of(context).pop(); // Close dialog
          },
        );
      },
    );
  }

  // Method to delete a task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index); // Remove task
    });
    saveData(); // Save updated list
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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0], // Task name
            taskCompleted: toDoList[index][1], // Task completed status
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
