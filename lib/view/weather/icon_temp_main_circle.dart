import 'package:flutter/material.dart';

import '../../model/forecast.dart';

class IconTempMainCircle extends StatelessWidget {
  final DailyForecast dailyForecast;

  const IconTempMainCircle({
    Key? key,
    required this.dailyForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 190,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: Column(
        children: [
          Image.network(
            'https://openweathermap.org/img/wn/${dailyForecast.weather.icon}@2x.png',
          ),
          Text(
            ' ${dailyForecast.temp.day}°',
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            dailyForecast.weather.main,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
