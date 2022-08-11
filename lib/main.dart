import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/favorite_city_provider.dart';
import 'providers/forecast_provider.dart';
import 'navigation/route_generator.dart';
import 'theme/weather_theme_data.dart';
import 'utils/constants.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ForecastProvider>(
          create: (_) => ForecastProvider()
        ),
        ChangeNotifierProvider<FavoriteCityProvider>(
          create: (_) => FavoriteCityProvider()
        ),
      ],
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      themeMode: ThemeMode.system,
      theme: WeatherThemeData.lightTheme,
      darkTheme: WeatherThemeData.darkTheme,
    );
  }
}
