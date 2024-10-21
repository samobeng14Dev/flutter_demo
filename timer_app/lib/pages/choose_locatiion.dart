import 'package:flutter/material.dart';

class ChooseLocatiion extends StatefulWidget {
  const ChooseLocatiion({super.key});

  @override
  State<ChooseLocatiion> createState() => _ChooseLocatiionState();
}

class _ChooseLocatiionState extends State<ChooseLocatiion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text('choose location screen'),

    );
  }
}