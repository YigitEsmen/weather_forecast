import 'package:flutter/material.dart';

import '../../model/forecast.dart';
import 'daily_forecast_cell.dart';

class DailyForecastListView extends StatelessWidget {
  final List<DailyForecast> dailyForecastList;

  const DailyForecastListView(this.dailyForecastList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )),
      child: ListView.builder(
        itemCount: dailyForecastList.length - 1,
        itemBuilder: (context, index) {
          return DailyForecastCell(dailyForecast: dailyForecastList[index + 1]);
        },
      ),
    );
  }
}
