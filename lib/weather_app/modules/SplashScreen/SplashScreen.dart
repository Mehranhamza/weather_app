import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/weather_app/modules/Homepage/HomePage_Screen.dart';
import 'package:weather_app/weather_app/routes/routes.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.leftToRight, child: HomePageScreen()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/animations/SplashImage.jpg'),
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                      color: Colors.black.withOpacity(0.1),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Lottie.asset(
                                'assets/animations/Splash.json',
                              ),
                              Text(
                                'Weather App',
                                style: GoogleFonts.hubballi(
                                    fontSize: 50, color: Colors.white),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Developed by Mehran Hamza',
                                style: GoogleFonts.hubballi(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
