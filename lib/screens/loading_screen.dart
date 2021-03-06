import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  locationWeather: weatherData,
                )));
  }

  // if the user didn't accept the first time
  // void getPermission() async {
  //   LocationPermission permission = await requestPermission();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Center(
        child: LoadingBouncingGrid.square(
          backgroundColor: Colors.orange.shade700,
          size: 40.0,
          inverted: true,
        ),
      ),
    );
  }
}
