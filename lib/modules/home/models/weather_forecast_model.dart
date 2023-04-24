// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:climate_app/modules/home/models/current_weather_model.dart';

class WeatherForecastModel {
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final WeatherCondition condition;

  WeatherForecastModel({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'condition': condition.toString(),
    };
  }

  factory WeatherForecastModel.fromMap(Map<String, dynamic> map) {
    return WeatherForecastModel(
      date: DateTime.fromMillisecondsSinceEpoch((map['date_epoch'] * 1000) as int).toUtc(),
      maxTemp: map['day']['maxtemp_c'] as double,
      minTemp: map['day']['mintemp_c'] as double,
      condition: fromWeatherCode(map['day']['condition']['code'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherForecastModel.fromJson(String source) =>
      WeatherForecastModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static WeatherCondition fromWeatherCode(int conde) {
    switch (conde) {
      case 1087:
      case 1171:
      case 1192:
      case 1195:
      case 1246:
      case 1261:
      case 1264:
      case 1273:
      case 1276:
      case 1279:
      case 1282:
        return WeatherCondition.storm;
      case 1063:
      case 1069:
      case 1072:
      case 1150:
      case 1153:
      case 1168:
      case 1180:
      case 1183:
      case 1186:
      case 1189:
      case 1198:
      case 1201:
      case 1204:
      case 1207:
      case 1240:
      case 1243:
      case 1249:
      case 1252:
        return WeatherCondition.rainy;
      case 1000:
        return WeatherCondition.sunny;
      case 1003:
        return WeatherCondition.partiallyCloudy;
      case 1006:
      case 1009:
      case 1030:
      case 1135:
      case 1147:
        return WeatherCondition.cloudy;
      default:
        return WeatherCondition.sunny;
    }
  }
}
