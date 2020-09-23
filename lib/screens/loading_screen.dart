import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/location.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.latitude}&appid=a9af7265269786f3f09092f21801be03');

    if (response.statusCode == 200) {
      String data = response.body;
      //print(data);
      var decodedData = jsonDecode(data);
      String cityName = decodedData['name'];
      print(cityName);
      double temp = decodedData['main']['temp'];
      print(temp);
      int conditionNumber = decodedData['weather'][0]['id'];
      print(conditionNumber);
    } else {
      String data = '';
      print(response.statusCode);
    }
  }

  // if the user didn't accept the first time
  // void getPermission() async {
  //   LocationPermission permission = await requestPermission();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: () {
                getLocation();
              },
              child: Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
