import 'package:dio/dio.dart';

class Api {
  static const String baseUrl = 'http://api.weatherapi.com/v1';
  static const String key = 'ade14f434d2544eb9bf163408232204';
  static const String location = '-18.573984,-46.513613';

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );

  Future<Response> getWeather() async {
    return await _dio.get(
      '/forecast.json',
      queryParameters: {
        'key': key,
        'q': location,
        'days': 7,
        'aqi': 'no',
        'alerts': 'no',
      },
    );
  }
}
