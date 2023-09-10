import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {

  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '59cac5ebf3a54e3fa77154147231608';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try
    {
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weatherData = WeatherModel.fromJson(data);
    }catch(e)
    {
        print(e);
    }

    return weatherData;
  }
}
