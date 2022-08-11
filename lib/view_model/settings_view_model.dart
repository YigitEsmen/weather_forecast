import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/utils/constants.dart';

import '../model/measurement_unit.dart';
import '../providers/forecast_provider.dart';
import '../services/database.dart';

class SettingsViewModel with ChangeNotifier {
  final BuildContext context;
  late MeasurementUnit _measurementUnit;

  SettingsViewModel(this.context) {
    _initMeasurementUnit();
  }

  void _initMeasurementUnit() {
    _measurementUnit = Database.readMeasurementUnit();
  }

  MeasurementUnit get measurementUnit => _measurementUnit;

  void changeMeasurementUnit() {
    _measurementUnit.toggle();
    notifyListeners();
  }

  void saveMeasurementUnit() {
    Database.updateMeasurementUnit(_measurementUnit);
    Provider.of<ForecastProvider>(context, listen: false).fetchForecast().then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 1),
          backgroundColor: Theme.of(context).primaryColorDark,
          content: const Text(Constants.saved),
        ),
      );
      Navigator.pop(context);
    });
  }
}
