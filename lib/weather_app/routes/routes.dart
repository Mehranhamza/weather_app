import 'package:flutter/material.dart';
import 'package:weather_app/weather_app/modules/Homepage/HomePage_Screen.dart';
import 'package:weather_app/weather_app/modules/SplashScreen/SplashScreen.dart';

class AppRoutes {
  static const HomePageRoute = '/HomePage';
  static const SplashScreenRoute = '/SplashScreen';
  static Route<dynamic> GenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePageRoute:
        return MaterialPageRoute(builder: (c) => HomePageScreen());
      case SplashScreenRoute:
        return MaterialPageRoute(builder: (c) => Splashscreen());
      default:
        return MaterialPageRoute(builder: (c) => HomePageScreen());
    }
  }
}
