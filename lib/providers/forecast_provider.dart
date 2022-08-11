import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';

import '../model/city.dart';
import '../model/forecast.dart';
import '../services/database.dart';

class ForecastProvider with ChangeNotifier {
  late String _apiKey;
  late Forecast _forecast;

  Future<void> loadVariables() async {
    /// Deactivate landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await FlutterConfig.loadEnvVariables();
    _apiKey = FlutterConfig.get('API_KEY');
    await Database.createDatabaseObject();
    await fetchForecast(listen: false);
  }

  Forecast get forecast => _forecast;

  Future<void> fetchForecast({String? cityName, final bool listen = true}) async {
    cityName ??= Database.readCityName();
    final measurementUnit = Database.readMeasurementUnit();
    final query =
        'https://api.openweathermap.org/data/2.5/forecast/daily?q=$cityName&appid=$_apiKey&units=${measurementUnit.name}';
    final url = Uri.parse(query);
    final response = await http.get(url);
    final parsedData = jsonDecode(response.body);
    if (parsedData['cod'] == '404') throw Exception(parsedData['message']);
    final int timezone = parsedData['city']['timezone'];
    final List list = parsedData['list'];
    _forecast = Forecast(
      city: City.fromMap(parsedData['city']),
      list: List.generate(list.length, (index) {
        final dailyForecastAsMap = list[index];
        return DailyForecast.fromMap(dailyForecastAsMap, timezone);
      }),
    );
    Database.updateCityName(cityName);
    if (listen) notifyListeners();
  }
}
