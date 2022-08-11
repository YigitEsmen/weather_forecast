import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/utils/extensions.dart';

import '../model/city.dart';
import '../model/measurement_unit.dart';

class Database {
  static late SharedPreferences _prefs;

  /// keys
  static const String _cityNameKey = 'city_name';
  static const String _measurementUnitNameKey = 'measurement_unit_name';
  static const String _favoriteCityListKey = 'favorite_city_list';

  /// default values
  static const String _defaultCityName = 'New York';
  static final MeasurementUnit _defaultMeasurementUnit = MeasurementUnit(name: MeasurementUnit.imperial);
  static final List<City> _defaultFavoriteCities = [
    City(id: 5128581, name: 'New York', country: 'US'),
    City(id: 2643743, name: 'London', country: 'GB'),
    City(id: 745042, name: 'Istanbul', country: 'TR'),
  ];

  static Future<void> createDatabaseObject() async => _prefs = await SharedPreferences.getInstance();

  static String readCityName() => _prefs.getString(_cityNameKey) ?? _defaultCityName;

  static void updateCityName(String newCityName) => _prefs.setString(_cityNameKey, newCityName);

  static MeasurementUnit readMeasurementUnit() {
    var measurementUnitName = _prefs.getString(_measurementUnitNameKey) ?? _defaultMeasurementUnit.name;
    switch (measurementUnitName) {
      case MeasurementUnit.imperial:
        return MeasurementUnit(name: MeasurementUnit.imperial);
      default:
        return MeasurementUnit(name: MeasurementUnit.metric);
    }
  }

  static void updateMeasurementUnit(MeasurementUnit measurementUnit) =>
      _prefs.setString(_measurementUnitNameKey, measurementUnit.name);

  static List<City> readFavoriteCities() {
    List<String>? favoriteCitiesAsJson = _prefs.getStringList(_favoriteCityListKey);
    return favoriteCitiesAsJson == null
        ? _defaultFavoriteCities
        : favoriteCitiesAsJson.map<City>((cityAsJson) => City.fromJson(cityAsJson)).toList();
  }

  static void updateFavoriteCityList(List<City> favoriteCityList) {
    var favoriteCitiesAsJson = favoriteCityList.map<String>((city) => city.toJson()).toList();
    _prefs.setStringList(_favoriteCityListKey, favoriteCitiesAsJson);
  }

  static void addFavoriteCity(City favoriteCity) {
    var favoriteCityList = readFavoriteCities();
    favoriteCityList.add(City(
      id: favoriteCity.id,
      name: readCityName().toTitleCase(),
      country: favoriteCity.country,
    ));
    updateFavoriteCityList(favoriteCityList);
  }

  static void removeFavoriteCity(City favoriteCity) {
    var favoriteCityList = readFavoriteCities();
    favoriteCityList.removeWhere((city) => city.id == favoriteCity.id);
    updateFavoriteCityList(favoriteCityList);
  }

  static bool isCityFavorite(City city) {
    var favoriteCityList = readFavoriteCities();
    return favoriteCityList.any((favoriteCity) => favoriteCity.id == city.id);
  }
}
