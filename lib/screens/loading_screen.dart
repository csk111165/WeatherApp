import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // this method is called each time the app is created at very first time
  @override
  void initState() {
     getLocation();
  }

  // method for getting the current location : Future<void> since we are awaiting to get some result
 void  getLocation() async {
   
   // create an object of Location class defined in services/location.dart
   Location location = Location();
   await location.getCurrentLocation();
   print("what is lat : ${location.latitude}");
   print("what is longi  ${location.longitude}");
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
