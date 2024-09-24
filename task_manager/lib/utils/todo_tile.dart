import "package:flutter/material.dart";

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              //Taks name
              Text(
                taskName,
                style: TextStyle(decoration:taskCompleted? TextDecoration.lineThrough:TextDecoration.none,),
              ),
            ],
          )),
    );
  }
}
