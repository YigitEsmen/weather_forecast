import 'package:flutter/material.dart';

import '../../model/city.dart';
import '../services/database.dart';

class FavoriteCityProvider with ChangeNotifier {
  List<City> get favoriteCities => Database.readFavoriteCities();

  void addFavoriteCity(City favoriteCity) {
    Database.addFavoriteCity(favoriteCity);
    notifyListeners();
  }

  void deleteFavoriteCity(City favoriteCity) {
    Database.removeFavoriteCity(favoriteCity);
    notifyListeners();
  }
}
