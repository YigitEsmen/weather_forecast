import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/forecast_provider.dart';

class FavoritesViewModel {
  final BuildContext context;

  FavoritesViewModel(this.context);

  void getWeatherData(String cityName) {
    Navigator.pop(context);
    var forecastProvider = Provider.of<ForecastProvider>(context, listen: false);
    forecastProvider.fetchForecast(cityName: cityName);
  }
}
