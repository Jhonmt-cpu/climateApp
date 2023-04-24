import 'package:climate_app/app/data/repositories/weather_respository.dart';
import 'package:climate_app/app/helpers/app_assets.dart';
import 'package:climate_app/app/helpers/app_colors.dart';
import 'package:climate_app/app/helpers/app_strings.dart';
import 'package:climate_app/app/utils/icon_from_weather_condition.dart';
import 'package:climate_app/modules/home/components/weather_forecast.dart';
import 'package:climate_app/modules/home/components/weather_badge.dart';
import 'package:climate_app/modules/home/models/weather_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  WeatherResponseModel? weatherResponse;

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: AppBar(
          elevation: 0,
        ),
      ),
      backgroundColor: AppColors.primary[700],
      body: !isLoading
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 20,
                  bottom: 40,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            color: AppColors.primary[1000],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: weatherResponse != null
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            weatherResponse!.current.currentTemp.toString(),
                                            style: const TextStyle(
                                              fontSize: 88,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.white,
                                              height: 1,
                                            ),
                                          ),
                                          Text(
                                            AppStrings.celsiusDegrees,
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.primary[100],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : const Text(
                                    'No data',
                                    style: TextStyle(
                                      fontSize: 88,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                      height: 1,
                                    ),
                                  ),
                          ),
                        ),
                        weatherResponse != null
                            ? Container(
                                transform: Matrix4.translationValues(-23, -34, 0),
                                child: SvgPicture.asset(
                                  iconFromWeatherCondition(weatherResponse!.current.condition),
                                  height: 130,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                    weatherResponse != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: WeatherBadge(
                                    type: BadgeType.wind,
                                    value: weatherResponse!.current.windSpeed.toInt(),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: WeatherBadge(
                                    type: BadgeType.humidity,
                                    value: weatherResponse!.current.humidity,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary[1000],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.separated(
                          itemCount: weatherResponse?.forecast.length ?? 0,
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return WeatherForecast(
                              model: weatherResponse!.forecast[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                color: AppColors.primary[400],
                                height: 10,
                                thickness: 3,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
              ),
            ),
    );
  }

  Future<void> getWeather() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await WeatherRepository().getWeather();

      setState(() {
        weatherResponse = response;
        isLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      setState(() {
        isLoading = false;
      });
    }
  }
}
