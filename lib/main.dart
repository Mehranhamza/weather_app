import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_app/modules/Homepage/HomePage_Controller.dart';
import 'package:weather_app/weather_app/modules/Homepage/HomePage_Screen.dart';
import 'package:weather_app/weather_app/modules/SplashScreen/SplashScreen.dart';
import 'package:weather_app/weather_app/routes/routes.dart';
import 'package:weather_app/weather_app/shared/themes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeScreenProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: lighttheme,
          home: Splashscreen(),
        ));
  }
}
