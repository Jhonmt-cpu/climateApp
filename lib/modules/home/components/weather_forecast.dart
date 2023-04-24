import 'package:climate_app/app/helpers/app_colors.dart';
import 'package:climate_app/app/helpers/app_strings.dart';
import 'package:climate_app/app/utils/icon_from_weather_condition.dart';
import 'package:climate_app/modules/home/models/weather_forecast_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({
    Key? key,
    required this.model,
  }) : super(key: key);

  final WeatherForecastModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 103,
            child: Text(
              determineWeekDay(model.date),
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primary[100],
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset(iconFromWeatherCondition(model.condition)),
          ),
          Text(
            '${model.minTemp}${AppStrings.degrees}',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primary[100],
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                gradient: const LinearGradient(
                  colors: [
                    AppColors.waterGreen,
                    AppColors.redTemperature,
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '${model.minTemp}${AppStrings.degrees}',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primary[100],
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  String determineWeekDay(DateTime date) {
    var weekDay = '';
    var today = DateTime.now().day;

    if (date.day == today) {
      weekDay = 'Hoje';
    } else if (date.day == today + 1) {
      weekDay = 'Amanhã';
    } else {
      switch (date.weekday) {
        case DateTime.monday:
          weekDay = 'Segunda-Feira';
          break;
        case DateTime.tuesday:
          weekDay = 'Terça-Feira';
          break;
        case DateTime.wednesday:
          weekDay = 'Quarta-Feira';
          break;
        case DateTime.thursday:
          weekDay = 'Quinta-Feira';
          break;
        case DateTime.friday:
          weekDay = 'Sexta-Feira';
          break;
        case DateTime.saturday:
          weekDay = 'Sábado';
          break;
        case DateTime.sunday:
          weekDay = 'Domingo';
          break;
      }
    }

    return weekDay;
  }
}
