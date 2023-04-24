import 'package:climate_app/modules/home/models/current_weather_model.dart';

WeatherCondition fromWeatherCode(int conde) {
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
