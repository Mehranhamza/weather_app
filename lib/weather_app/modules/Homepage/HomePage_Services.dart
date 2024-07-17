import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherAPI {
  String? API;
  WeatherAPI({required this.API});
  Future getWeatherData() async {
    final response = await http.get(Uri.parse(API!));
    try {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      throw e;
    }
  }
}
