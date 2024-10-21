import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    // Simulate a network request
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      // Process the response
      print('Response data: ${response.body}');
    } else {
      // Handle the error
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading Screen'),
      ),
    );
  }
}
