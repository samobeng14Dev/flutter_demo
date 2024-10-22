import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // Import this package for date formatting

class WorldTime {
  String location;
  String flag;
  String url;
  String time; 
  String errorMessage = '';

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
    this.time = '', 
  });

  Future<void> getTime() async {
    try {
      final response = await http.get(Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=Europe%2F$url'));

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        // Get the time string (assuming it's in 24-hour format)
        String timeStr = data['dateTime']; // Adjust based on the API response
        DateTime dateTime = DateTime.parse(timeStr); // Parse the string to DateTime
        time = DateFormat.jm().format(dateTime); // Format to 12-hour format with AM/PM
      } else {
        errorMessage = 'Failed to load time data: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'Could not get time data';
    }
  }
}
