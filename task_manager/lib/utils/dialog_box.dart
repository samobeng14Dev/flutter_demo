import 'package:flutter/material.dart';
import 'package:task_manager/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({super.key, required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content:Container(height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        TextField(
          controller:controller,
          decoration: const InputDecoration(border:OutlineInputBorder(),
          hintText: "Add a new task",
          ),
        ),
        //save and cancell buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          MyButton(text:"Save",onPressed: onSave,color: Colors.yellow,),
          const SizedBox(width: 8,),
          MyButton(text:"Cancel",onPressed: onCancel,color:Colors.yellow,),

        ],)
      ],),
      )
    );
  }
}