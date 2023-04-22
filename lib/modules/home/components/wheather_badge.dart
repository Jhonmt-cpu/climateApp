import 'package:climate_app/app/helpers/app_assets.dart';
import 'package:climate_app/app/helpers/app_colors.dart';
import 'package:climate_app/app/helpers/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum BadgeType {
  wind,
  rain,
}

class WeatherBadge extends StatelessWidget {
  const WeatherBadge({
    Key? key,
    required this.type,
    required this.value,
  }) : super(key: key);

  final BadgeType type;
  final int value;

  @override
  Widget build(BuildContext context) {
    String asset = '';
    String title = '';
    String metric = '';

    switch (type) {
      case BadgeType.wind:
        asset = AppAssets.wind;
        title = AppStrings.wind;
        metric = AppStrings.windSpeed;
        break;
      case BadgeType.rain:
        asset = AppAssets.rain;
        title = AppStrings.rain;
        metric = AppStrings.percentage;
        break;
    }

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary[1000],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            asset,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.primary[50],
                  fontSize: 12,
                ),
              ),
              Text(
                '$value $metric',
                style: TextStyle(
                  color: AppColors.primary[50],
                  fontSize: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
