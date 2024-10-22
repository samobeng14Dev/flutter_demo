import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String location;
  String flag;
  String url;
  String time; 
  String errorMessage = ''; // Variable to hold error message

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
    this.time = '', // Optional parameter with default value
  });

  Future<void> getTime() async {
    try {
      // Use http.get to make the request
      final response = await http.get(Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=Europe%2F$url'));
      
      // Check if the response was successful
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print('Data: $data');
        time = data['time']; // Access the time property
      } else {
        errorMessage = 'Failed to load time data: ${response.statusCode}';
        print(errorMessage);
      }
    } catch (e) {
      errorMessage = 'Could not get time data';
      print('Error occurred: $e');
    }
  }
}
