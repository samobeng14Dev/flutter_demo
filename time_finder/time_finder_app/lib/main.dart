import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('S NINJA ID', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(40.0, 40.0, 30.0, 0.0),
          child: Column(
            children: <Widget>[
              Text(
                'NAME',
                style: TextStyle(color: Colors.grey, letterSpacing: 1.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Kwame Afriyie',
                style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'CURRENT LEVEL',
                style: TextStyle(color: Colors.grey, letterSpacing: 1.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '8',
                style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.0,
              )
            
            ],
          ),
        ),
      ),
    );
  }
}
