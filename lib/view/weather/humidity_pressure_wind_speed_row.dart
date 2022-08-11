import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../model/forecast.dart';
import '../../services/database.dart';
import 'demonstrator.dart';

class HumidityPressureWindSpeedRow extends StatelessWidget {
  final DailyForecast dailyForecast;

  const HumidityPressureWindSpeedRow({
    Key? key,
    required this.dailyForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String unit = Database.readMeasurementUnit().unit;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Demonstrator(
          iconData: WeatherIcons.humidity,
          text: '${dailyForecast.humidity}%',
        ),
        Demonstrator(
          iconData: WeatherIcons.barometer,
          text: '${dailyForecast.pressure} psi',
        ),
        Demonstrator(
          iconData: WeatherIcons.strong_wind,
          text: '${dailyForecast.windSpeed} $unit',
          gapBetweenIconAndText: 8,
        ),
      ],
    );
  }
}
