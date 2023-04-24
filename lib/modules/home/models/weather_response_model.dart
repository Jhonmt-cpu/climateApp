import 'package:climate_app/modules/home/models/current_weather_model.dart';
import 'package:climate_app/modules/home/models/weather_forecast_model.dart';

class WeatherResponseModel {
  final CurrentWeatherModel current;
  final List<WeatherForecastModel> forecast;

  WeatherResponseModel({
    required this.current,
    required this.forecast,
  });
}
