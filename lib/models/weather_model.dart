
import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel
{
   DateTime date;
   double temp;
   double maxTemp;
   double minTemp;
   String weatherStateName;

  WeatherModel(
      {required this.date,
        required this.temp,
        required this.maxTemp,
        required this.minTemp,
        required this.weatherStateName
      });

  factory WeatherModel.fromJson(Map<String, dynamic>  data)
  {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  @override
  String toString() {
    return 'temp = $temp minTemp = $minTemp maxTemp = $maxTemp date =$date ';
  }

  String getImage()
  {
    if(weatherStateName == 'Clear'|| weatherStateName == 'Light cloud')
    {
      return 'assets/images/clear.png';
    }
    else if(weatherStateName == 'Sleet'
        ||weatherStateName == 'Snow' || weatherStateName == 'Hail')
    {
      return 'assets/images/snow.png';
    }
    else if(weatherStateName == 'Heavy cloud'
        ||weatherStateName=='Patchy rain possible'
        ||weatherStateName=='Partly cloudy')
    {
      return 'assets/images/cloudy.png';
    }
    else if(weatherStateName == 'Light rain'||weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers'|| weatherStateName =='Moderate rain')
    {
      return 'assets/images/rainy.png';
    }
    else if(weatherStateName == 'Thunderstorm'||weatherStateName == 'Thunder')
    {
      return 'assets/images/thunderstorm.png';
    }
    else
    {
      return 'assets/images/clear.png';
    }
  }

   MaterialColor getThemeColor()
   {
     if(weatherStateName == 'Clear'|| weatherStateName == 'Light cloud'
         || weatherStateName == 'Sunny')
     {
       return Colors.orange;
     }
     else if(weatherStateName == 'Sleet'
         ||weatherStateName == 'Snow' || weatherStateName == 'Hail')
     {
       return Colors.cyan;
     }
     else if(weatherStateName == 'Heavy cloud'
         ||weatherStateName=='Patchy rain possible'
         ||weatherStateName=='Partly cloudy')
     {
       return Colors.grey;
     }
     else if(weatherStateName == 'Light rain'||weatherStateName == 'Heavy rain' ||
         weatherStateName == 'Showers'|| weatherStateName =='Moderate rain')
     {
       return Colors.blue;
     }
     else if(weatherStateName == 'Thunderstorm'||weatherStateName == 'Thunder')
     {
       return Colors.blueGrey;
     }
     else
     {
       return Colors.blue;
     }
   }
}