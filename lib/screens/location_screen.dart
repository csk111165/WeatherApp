import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  // to store the data received from loading screen
  final locationWeather;

  LocationScreen({required this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature = 0;
  String weatherIcon = '';
  String? cityName;
  String weatherMessage = '';

  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    // print("inside the init state of the LocationScreen");
    // print(widget.locationWeather); // widget provides the access of LocationScreen here, so that data can be shared acrss
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    // setState since we want to update the values as the weather data gets updated..
    setState(() {
      // in case the api returns a null data of weather due to some access issue or weather server down issue
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = "Unable to get the weather condition";
        cityName = 'Unknown';
        return; // don't forget to return otherwise it would try to execute the below statments which will cause issue.
      }
      double temp = weatherData['main']['temp'];
      temperature =
          temp.toInt(); // this is to avoid the floating decimal in temperature.
      var condition = weatherData['weather'][0]['id'];
      // get the icon from condition.
      weatherIcon = weather.getWeatherIcon(condition);
      // get weather message
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      // now when the location button is clicked at top, it will fetch new location
                      var weatherData =
                          await WeatherModel().getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      // we want to go to city page
                      var typedCityName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      },),);
                      
                      // get the typed city name coming from the city_screen TextField after clicking the button get weather
                      if(typedCityName != null) {
                        var weatherData = await weather.getCityWeather(typedCityName);
                        updateUI(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
