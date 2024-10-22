import 'package:flutter/material.dart';
import 'package:timer_app/services/world_time.dart';

class ChooseLocatiion extends StatefulWidget {
  const ChooseLocatiion({super.key});

  @override
  State<ChooseLocatiion> createState() => _ChooseLocatiionState();
}

class _ChooseLocatiionState extends State<ChooseLocatiion> {
  List<WorldTime> locations = [
  WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
  WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
  WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
  WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
  WorldTime(location: 'Sydney', flag: 'australia.png', url: 'Australia/Sydney'),
  WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
  WorldTime(location: 'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos'),
  WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
  WorldTime(location: 'Cape Town', flag: 'south_africa.png', url: 'Africa/Johannesburg'),
  WorldTime(location: 'Accra', flag: 'ghana.png', url: 'Africa/Accra'),
 
];


  
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