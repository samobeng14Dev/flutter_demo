import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; 

class WorldTime {
  String location;
  String flag;
  String url;
  String time; 
  String errorMessage = '';
  bool isDayTime;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
    this.time = '', 
    this.isDayTime = false, // Set a default value
  });

  Future<void> getTime() async {
    try {
      final response = await http.get(Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=Europe%2F$url'));

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        // Get the time string
        String timeStr = data['dateTime']; 
        DateTime dateTime = DateTime.parse(timeStr);
        
        // Determine if it's daytime
        isDayTime = dateTime.hour >= 6 && dateTime.hour < 20; // More intuitive to include 6 AM

        // Format to 12-hour format with AM/PM
        time = DateFormat.jm().format(dateTime); 
      } else {
        errorMessage = 'Failed to load time data: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'Could not get time data';
    }
  }
}
