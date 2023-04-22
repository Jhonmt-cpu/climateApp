import 'package:climate_app/app/helpers/app_assets.dart';
import 'package:climate_app/app/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({Key? key}) : super(key: key);

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
          Text(
            'Segunda-feira',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primary[100],
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset(AppAssets.sunny),
          ),
          Text(
            '30º',
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
            '20º',
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
}
