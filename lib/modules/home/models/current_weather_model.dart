// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:climate_app/app/utils/from_weather_code.dart';

enum WeatherCondition {
  storm,
  rainy,
  sunny,
  cloudy,
  partiallyCloudy,
}

class CurrentWeatherModel {
  final DateTime date;
  final double currentTemp;
  final double windSpeed;
  final int humidity;
  final WeatherCondition condition;

  CurrentWeatherModel({
    required this.date,
    required this.currentTemp,
    required this.windSpeed,
    required this.humidity,
    required this.condition,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'currentTemp': currentTemp,
      'windSpeed': windSpeed,
      'humidity': humidity,
      'condition': condition.toString(),
    };
  }

  factory CurrentWeatherModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherModel(
      date: DateTime.fromMillisecondsSinceEpoch((map['last_updated_epoch'] * 1000) as int),
      currentTemp: map['temp_c'] as double,
      windSpeed: map['wind_kph'] as double,
      humidity: map['humidity'] as int,
      condition: fromWeatherCode(map['condition']['code'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherModel.fromJson(String source) =>
      CurrentWeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
