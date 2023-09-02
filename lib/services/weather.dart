import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
const String apiKey = '4f8619ef2e7f68e984133c8edb59dee4';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5';


class WeatherModel {

  Future<dynamic> getLocationWeather() async{

    Location location = Location();
    await location.getCurrentLocation();
    // here the NetworkHelper will use the lat and lon value to fetch the information from api using getData
    NetworkHelper networkHelper = NetworkHelper(url:'$openWeatherMapURL/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'); // unit=metric for getting temp in celiciup see the api documentation for the openweathermap

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}