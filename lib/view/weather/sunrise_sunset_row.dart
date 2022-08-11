import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../model/forecast.dart';
import 'demonstrator.dart';

class SunriseSunsetRow extends StatelessWidget {
  final DailyForecast dailyForecast;

  const SunriseSunsetRow({
    Key? key,
    required this.dailyForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Demonstrator(
          iconData: WeatherIcons.sunrise,
          text: dailyForecast.sunrise,
          gapBetweenIconAndText: 14,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: Demonstrator(
            iconData: WeatherIcons.sunset,
            text: dailyForecast.sunset,
            gapBetweenIconAndText: 8,
            textOnRightSide: false,
          ),
        ),
      ],
    );
  }
}
