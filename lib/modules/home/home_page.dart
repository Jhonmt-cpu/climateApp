import 'package:climate_app/app/helpers/app_assets.dart';
import 'package:climate_app/app/helpers/app_colors.dart';
import 'package:climate_app/app/helpers/app_strings.dart';
import 'package:climate_app/modules/home/components/weather_forcast.dart';
import 'package:climate_app/modules/home/components/wheather_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '18',
                                style: TextStyle(
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
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 15),
                              const Text(
                                '22${AppStrings.degrees}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  height: 1,
                                ),
                              ),
                              Text(
                                '16${AppStrings.degrees}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary[400],
                                  height: 1,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(-23, -50, 0),
                    child: SvgPicture.asset(
                      AppAssets.cloudy,
                      height: 130,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: const [
                    Expanded(
                        child: WeatherBadge(
                      type: BadgeType.wind,
                      value: 30,
                    )),
                    SizedBox(width: 20),
                    Expanded(
                        child: WeatherBadge(
                      type: BadgeType.rain,
                      value: 30,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary[1000],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.separated(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const WeatherForecast();
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
              // Stack(
              //   children: [
              //     Container(
              //       height: 200,
              //       decoration: BoxDecoration(
              //         color: AppColors.primary[1000],
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //     SfRadialGauge(
              //       axes: <RadialAxis>[
              //         RadialAxis(
              //           minimum: 0,
              //           maximum: 100,
              //           interval: 4,
              //           startAngle: 180,
              //           endAngle: 360,
              //           showLabels: false,
              //           showAxisLine: false,
              //           offsetUnit: GaugeSizeUnit.factor,
              //           minorTicksPerInterval: 0,
              //           radiusFactor: 1,
              //           majorTickStyle: const MajorTickStyle(
              //             length: 0.05,
              //             thickness: 3,
              //             lengthUnit: GaugeSizeUnit.factor,
              //             color: AppColors.yellow,
              //           ),
              //           pointers: const [
              //             MarkerPointer(
              //               value: 50,
              //               markerType: MarkerType.circle,
              //               color: AppColors.yellow,
              //               markerHeight: 20,
              //               markerWidth: 20,
              //             ),
              //           ],
              //           annotations: const [
              //             GaugeAnnotation(
              //               angle: 270,
              //               positionFactor: 0.4,
              //               widget: Text('16:44'),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
