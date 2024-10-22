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
    //set background
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    MaterialColor bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/$bgImage'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Color.fromARGB(255, 241, 189, 241),
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[400]),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Optionally display data if it exists
                    if (data.isNotEmpty)
                      Text(
                        'Location: ${data['location'] ?? 'Unknown'}',
                        style: const TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.white),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (data.isNotEmpty)
                      Text(
                        ' ${data['time'] ?? 'Unknown'}',
                        style: const TextStyle(
                            fontSize: 60.0,
                            letterSpacing: 2.0,
                            color: Colors.white),
                      )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
