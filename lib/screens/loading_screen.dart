import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

    getLocation();
    
  }

  // this function is for extracting the data using api provided by weatehr
  void getData() async {

     try {
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));

    if (response.statusCode == 200) {
      print("Success");
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      String weatherDesc = decodedData['weather'][0]['description'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];
      print("what is temp in my area $temperature");
      print("what is cityName $cityName");
      print("what is weather condition today : $weatherDesc");

    } else {
      print('status code: ${response.statusCode}');
      // print("Request failed with status: ${response.body}");
      print(response.body);
    }
  } catch (e) {
   
    print("Error: $e");
  }
  
  }

  // method for getting the current location : Future<void> since we are awaiting to get some result
  void getLocation() async {
    // create an object of Location class defined in services/location.dart
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    print("what is lat : ${location.latitude}");
    print("what is longi  ${location.longitude}");

    getData();
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
