import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color color; 
  final VoidCallback onPressed; 

  // Constructor with required parameters
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color, // Color parameter
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color, 
      child: Text(text),
    );
  }
}
