import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Check if ModalRoute is not null and has arguments
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;

    if (arguments != null) {
      data = arguments; // Safely assign the arguments if they exist
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Optionally display data if it exists
                  if (data.isNotEmpty)
                    Text(
                      'Location: ${data['location'] ?? 'Unknown'}',
                      style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                    ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (data.isNotEmpty)
                    Text(
                      ' ${data['time'] ?? 'Unknown'}',
                      style: TextStyle(fontSize: 60.0, letterSpacing: 2.0),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
