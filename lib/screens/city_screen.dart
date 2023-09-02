import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black), // this is for the color of input text
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)), // to provide the rounded border
                      borderSide: BorderSide.none,
                    ),
                    // hoverColor: Colors.teal,
                    fillColor: Colors.white,
                    icon: Icon(Icons.location_city, color: Colors.white,),
                    hintText: "Enter city name",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),


                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}