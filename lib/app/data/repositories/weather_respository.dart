import 'package:climate_app/app/data/providers/api.dart';
import 'package:climate_app/modules/home/models/current_weather_model.dart';
import 'package:climate_app/modules/home/models/weather_forecast_model.dart';
import 'package:climate_app/modules/home/models/weather_response_model.dart';

class WeatherRepository {
  final Api api = Api();

  Future<WeatherResponseModel> getWeather() async {
    final response = await api.getWeather();

    final CurrentWeatherModel currentWeather =
        CurrentWeatherModel.fromMap(response.data['current']);

    final List<WeatherForecastModel> forecastWeather = response.data['forecast']['forecastday']
        .map<WeatherForecastModel>((e) => WeatherForecastModel.fromMap(e as Map<String, dynamic>))
        .toList();

    return WeatherResponseModel(
      current: currentWeather,
      forecast: forecastWeather,
    );
  }
}
