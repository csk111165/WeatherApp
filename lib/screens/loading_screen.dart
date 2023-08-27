import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

// const String apiKey = 'b6907d289e10d714a6e88b30761fae22';
const String apiKey = '4f8619ef2e7f68e984133c8edb59dee4';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  // this method is called each time the app is created at very first time
  @override
  void initState() {
    print("initSTate is called");
    getLocationData();
  }

  // method for getting the current location : Future<void> since we are awaiting to get some result
  void getLocationData() async {
    print("getLocationData is called");
    // create an object of Location class defined in services/location.dart
    // it will give the locaiton which contains information about lat and lon
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    //----------------------------------------------------------------------

    // here the NetworkHelper will use the lat and lon value to fetch the information from api using getData
    NetworkHelper networkHelper = NetworkHelper(url:'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,); // the weatherData be passed to the LocationScreen not _LocationScreenState
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
