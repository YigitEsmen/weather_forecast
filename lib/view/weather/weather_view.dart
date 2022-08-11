import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/city.dart';
import '../../model/forecast.dart';
import '../../providers/favorite_city_provider.dart';
import '../../providers/forecast_provider.dart';
import '../../services/database.dart';
import '../../utils/constants.dart';
import '../search/search_view.dart';
import 'daily_forecast_list_view.dart';
import 'weather_popup_menu_button.dart';
import 'humidity_pressure_wind_speed_row.dart';
import 'icon_temp_main_circle.dart';
import 'sunrise_sunset_row.dart';

class WeatherView extends StatelessWidget {
  static const routeName = '/weather-view';

  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Forecast forecast = Provider.of<ForecastProvider>(context).forecast;
    return Scaffold(
      appBar: buildAppBar(context, forecast.city),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: buildDate(forecast.list.first.date),
            ),
            IconTempMainCircle(dailyForecast: forecast.list.first),
            const SizedBox(height: 16),
            HumidityPressureWindSpeedRow(dailyForecast: forecast.list.first),
            const Divider(thickness: 2, height: 24),
            SunriseSunsetRow(dailyForecast: forecast.list.first),
            const Text(
              Constants.thisWeek,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: DailyForecastListView(forecast.list),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, City city) {
    return AppBar(
      leading: Consumer<FavoriteCityProvider>(
        builder: (context, favoriteCityProvider, _) {
          var isFavoriteCity = Database.isCityFavorite(city);
          return IconButton(
            onPressed: () => isFavoriteCity
                ? favoriteCityProvider.deleteFavoriteCity(city)
                : favoriteCityProvider.addFavoriteCity(city),
            icon: Icon(
              isFavoriteCity ? Icons.favorite : Icons.favorite_border,
              color: isFavoriteCity ? Colors.red : Theme.of(context).colorScheme.onPrimary,
            ),
          );
        },
      ),
      title: Text('${city.name}${city.country.isEmpty ? '' : ', ${city.country}'}'),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, SearchView.routeName),
          icon: const Icon(Icons.search),
        ),
        const WeatherPopupMenuButton(),
      ],
    );
  }

  Widget buildDate(String date) => Text(
        date,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
}
