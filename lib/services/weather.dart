import 'package:clima_weather_app/services/location.dart';
import 'package:clima_weather_app/services/networking.dart';

const apikey = "bdd5ffc0de016eca38026f03661420b2";
const url = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  CurrentLocationData currentLocationData = CurrentLocationData();
  Future<dynamic> getweatherByCityName(String cityName) async {
    await CurrentLocationData().getCurrentLocation();
    NetworkingHelper networkingHelper =
        NetworkingHelper('$url?q=$cityName&appid=$apikey&units=metric');
    var weatherData = await networkingHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    await currentLocationData.getCurrentLocation();
    //print(currentLocationData.latitude);
    NetworkingHelper networkingHelper = NetworkingHelper(
        '$url?lat=${currentLocationData.latitude}&lon=${currentLocationData.longitude}&appid=$apikey&units=metric');
    var weatherData = await networkingHelper.getData();
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
