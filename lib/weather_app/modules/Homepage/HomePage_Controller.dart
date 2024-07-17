import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/weather_app/modules/Homepage/HomePage_Services.dart';

class HomeScreenProvider extends ChangeNotifier {
  String? LocationName;
  late Position currentPosition;
  String? API =
      'http://api.weatherapi.com/v1/current.json?key=9d3e102e8d9d4add869133432221903&q=Faisalabad&aqi=no';

  var APIresponse;
  Future getLocation() async {
    LocationPermission p = await Geolocator.checkPermission();
    if (p == LocationPermission.denied) {
      p = await Geolocator.requestPermission();
      if (p == LocationPermission.denied) {
        print('error');
      }
    }
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var latitude = currentPosition.latitude;
    var longitude = currentPosition.longitude;

    String? API =
        'http://api.weatherapi.com/v1/current.json?key=9d3e102e8d9d4add869133432221903&q=${latitude},${longitude}&aqi=no';
    final weatherService = WeatherAPI(API: API);
    var data = await weatherService.getWeatherData();
    APIresponse = data;
    LocationName = APIresponse['location']['name'];
    print(APIresponse);
    notifyListeners();
  }
}
