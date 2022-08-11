import 'package:flutter/material.dart';

import '../../model/forecast.dart';
import '../../utils/constants.dart';

class DailyForecastCell extends StatelessWidget {
  final DailyForecast dailyForecast;

  const DailyForecastCell({
    Key? key,
    required this.dailyForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: Constants.borderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildWeekDayAndIcon(),
          buildDescriptionText(context),
          buildMinAndMaxTempText(context),
        ],
      ),
    );
  }

  Row buildWeekDayAndIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 30,
          child: Text(dailyForecast.weekDay),
        ),
        const SizedBox(width: 36),
        Image.network(
          'https://openweathermap.org/img/wn/${dailyForecast.weather.icon}@2x.png',
          width: 60,
          height: 60,
        ),
      ],
    );
  }

  Container buildDescriptionText(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(28)),
      ),
      child: Text(dailyForecast.weather.description),
    );
  }

  Widget buildMinAndMaxTempText(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: '${dailyForecast.temp.min}° '),
          TextSpan(text: '${dailyForecast.temp.max}°'),
        ],
      ),
    );
  }
}
