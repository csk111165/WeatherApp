import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // this method is called each time the app is created at very first time
  @override
  void initState() {
    getLocation();
    getData();
  }

  
  // this function is for extracting the data using api provided by weatehr
  void getData() async {

     try {
    http.Response response = await http.get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'));

    if (response.statusCode == 200) {
      print("Success");
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      String weatherDesc = decodedData['weather'][0]['description'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];



    } else {
      print('status code: ${response.statusCode}');
      // print("Request failed with status: ${response.body}");
    }
  } catch (e) {
   
    print("Error: $e");
  }
  //   if (response.statusCode == 200) {
  //   // Process the response
  //   print("successfully loaded the page");
  //   // print("Response data: ${response.body}");
  // } else {
  //   print("Request failed with status: ${response.statusCode}");
  // }
  }

  // method for getting the current location : Future<void> since we are awaiting to get some result
  void getLocation() async {
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
