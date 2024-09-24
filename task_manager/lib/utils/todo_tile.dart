import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)?deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        // Specify the key for the Slidable widget
        key: ValueKey(taskName),

        // Action pane for sliding from the start (left side)
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
          SlidableAction(
              onPressed: deleteFunction,
              backgroundColor: Colors.red.shade300,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(20),
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),

        // Child widget for the task content
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              // Task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
