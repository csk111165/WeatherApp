import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
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


                  );