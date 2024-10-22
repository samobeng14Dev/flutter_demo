import 'package:flutter/material.dart';
import 'package:timer_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = '';
  String errorMessage = '';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: "London", flag: 'england.png', url: 'London');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      
    });
    // setState(() {
    //   time = instance.time; // Store the time retrieved
    //   errorMessage = instance.errorMessage; // Get the error message
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading...'
          // errorMessage.isNotEmpty ? errorMessage : (time.isNotEmpty ? 'Current time: $time' : 'Loading...'),
        ),
      ),
    );
  }
}
