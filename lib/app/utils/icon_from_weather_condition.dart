import 'package:climate_app/app/helpers/app_assets.dart';
import 'package:climate_app/modules/home/models/current_weather_model.dart';

String iconFromWeatherCondition(WeatherCondition condition) {
  switch (condition) {
    case WeatherCondition.sunny:
      return AppAssets.sunny;
    case WeatherCondition.cloudy:
      return AppAssets.cloudy;
    case WeatherCondition.partiallyCloudy:
      return AppAssets.partialCloudy;
    case WeatherCondition.rainy:
      return AppAssets.rainy;
    case WeatherCondition.storm:
      return AppAssets.storm;
  }
}
