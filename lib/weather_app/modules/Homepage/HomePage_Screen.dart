import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_app/modules/Homepage/HomePage_Controller.dart';
import 'package:weather_app/weather_app/shared/constants.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    final weatherController =
        Provider.of<HomeScreenProvider>(context, listen: false);
    await weatherController.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<HomeScreenProvider>(
        builder: (context, value, child) => SafeArea(
              child: value.LocationName == null
                  ? Scaffold(
                      body: Container(
                        child: Center(
                            child: SpinKitCircle(
                          color: Colors.white,
                        )),
                        height: heigth,
                        width: width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [
                              0.2,
                              0.75
                            ],
                                colors: [
                              Color(0xff955cd1),
                              Color(0xff3fa2fa)
                            ])),
                      ),
                    )
                  : Scaffold(
                      body: RefreshIndicator(
                      onRefresh: () async {
                        await value.getLocation();
                      },
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 30),
                                height: heigth,
                                width: width,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    // borderRadius: BorderRadius.circular(40),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        stops: [
                                          0.2,
                                          0.75
                                        ],
                                        colors: [
                                          Color(0xff955cd1),
                                          Color(0xff3fa2fa)
                                        ])),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: heigth * 0.07,
                                      child: Text(
                                        '${value.APIresponse['location']['name']}',
                                        style: GoogleFonts.mavenPro(
                                            fontSize: 45,
                                            color:
                                                Colors.white.withOpacity(0.9)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all()
                                          ),
                                      height: heigth * 0.03,
                                      child: Text(
                                        '${value.APIresponse['location']['localtime'] ?? ''}',
                                        style: GoogleFonts.mavenPro(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color:
                                                Colors.white.withOpacity(0.9)),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all()
                                          ),
                                      child: value.APIresponse['current']
                                                  ['condition']['text'] ==
                                              "Overcast"
                                          ? Lottie.asset(
                                              'assets/animations/overcast.json',
                                              height: heigth * 0.3)
                                          : value.APIresponse['current']
                                                      ['condition']['text'] ==
                                                  "Mist"
                                              ? Lottie.asset(
                                                  'assets/animations/Mist.json',
                                                  height: heigth * 0.3)
                                              : value.APIresponse['current']['condition']
                                                          ['text'] ==
                                                      "Cloudy"
                                                  ? Lottie.asset(
                                                      'assets/animations/Cloudy.json',
                                                      height: heigth * 0.3)
                                                  : value.APIresponse['current']
                                                              ['condition']['text'] ==
                                                          "Sunny"
                                                      ? Lottie.network('$Sunny', height: heigth * 0.3)
                                                      : value.APIresponse['current']['condition']['text'] == "Clear"
                                                          ? Lottie.network('$ClearNight', height: heigth * 0.3)
                                                          : Container(
                                                              child:
                                                                  Image.network(
                                                                height: heigth *
                                                                    0.3,
                                                                'https:${value.APIresponse['current']['condition']['icon']}',
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all()
                                          ),
                                      height: heigth * 0.08,
                                      child: Text(
                                        '${value.APIresponse['current']['condition']['text']}',
                                        style: GoogleFonts.hubballi(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 40,
                                            color:
                                                Colors.white.withOpacity(0.9)),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all()
                                          ),
                                      height: heigth * 0.08,
                                      child: Text(
                                        '${value.APIresponse['current']['temp_c']}°',
                                        style: GoogleFonts.hubballi(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 57,
                                            color:
                                                Colors.white.withOpacity(0.9)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all()
                                          ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: heigth * 0.1,
                                                child: Lottie.network(
                                                    '$WindDetail'),
                                              ),
                                              Text(
                                                'Wind',
                                                style: GoogleFonts.mavenPro(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                '${value.APIresponse['current']['wind_kph']}km/h',
                                                style: GoogleFonts.mavenPro(
                                                    fontSize: 22,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: heigth * 0.1,
                                                child: Image.network(
                                                  'https://cdn-icons-png.flaticon.com/512/219/219816.png',
                                                  color: Colors.blue.shade200,
                                                ),
                                              ),
                                              Text(
                                                'Humidity',
                                                style: GoogleFonts.mavenPro(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                '${value.APIresponse['current']['humidity']}',
                                                style: GoogleFonts.mavenPro(
                                                    fontSize: 22,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: heigth * 0.1,
                                                child: Lottie.network(
                                                    'https://lottie.host/afb153f1-5e8d-4761-8ce1-0c70a3fad459/tRoRQ02CVl.json'),
                                              ),
                                              Text(
                                                'Wind Direction',
                                                style: GoogleFonts.mavenPro(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                '${value.APIresponse['current']['wind_dir']}',
                                                style: GoogleFonts.mavenPro(
                                                    fontSize: 22,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
            ));
  }
}
