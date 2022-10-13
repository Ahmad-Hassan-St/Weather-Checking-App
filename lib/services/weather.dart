import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey='ace37e1afdfa139a23a7c55a150d8403';
const String OpenWeatherUrl='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> GetCityWeather(String city) async{
    String url='$OpenWeatherUrl?q=$city&appid=$apiKey&units=metric';
    Location location=  Location();
    NetworkHelper net= await NetworkHelper(url);
    var weatherdata= net.GetData();
    return weatherdata;

  }

  dynamic GetWeatherData()async{
    Location loc=Location();
    await loc.GetLocation();
    NetworkHelper net=NetworkHelper('$OpenWeatherUrl?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric'
    );
    var weatherdata= await net.GetData();
    return weatherdata;
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
