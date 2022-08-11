import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/forecast_provider.dart';
import '../view/search/city_not_found_dialog.dart';

class SearchViewModel {
  BuildContext context;

  SearchViewModel(this.context);

  void getWeatherData(String cityName) async {
    var weatherProvider = Provider.of<ForecastProvider>(context, listen: false);
    weatherProvider.fetchForecast(cityName: cityName).then((_) {
      Navigator.of(context).pop();
    }).catchError((error) {
      _showCityNotFoundDialog();
    });
  }

  void _showCityNotFoundDialog() {
    showDialog(
      context: context,
      builder: (context) => const CityNotFoundDialog(),
    );
  }
}
