import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  void getPermission() async {
    LocationPermission permission = await requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: () {
                getPermission();
              },
              child: Text('Get Permission'),
            ),
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
