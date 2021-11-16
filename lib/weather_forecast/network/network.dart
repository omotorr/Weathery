import 'dart:convert';
import 'package:flutter_weather_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:flutter_weather_app/weather_forecast/util/forecast_util.dart';
import 'package:http/http.dart' as http;

class Network{
  Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async {
    var finalUrl= "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+
        "&appid="+Util.appId+"&units=imperial";
final response = await http.get(Uri.parse(finalUrl));
print("URL: ${Uri.encodeFull(finalUrl)}");

if (response.statusCode ==200){
  print("weather data: ${response.body}");
  return WeatherForecastModel.fromJson(json.decode(response.body));
}else{
  throw Exception("Error getting weather forecast");
}

  }

}