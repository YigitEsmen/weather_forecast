import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favorite_city_provider.dart';
import '../../view_model/favorites_view_model.dart';
import 'favorite_city_cell.dart';

class FavoriteCityListView extends StatelessWidget {
  final FavoriteCityProvider favoriteCityProvider;

  const FavoriteCityListView(this.favoriteCityProvider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<FavoritesViewModel>(context, listen: false);
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: favoriteCityProvider.favoriteCities.length,
      primary: false,
      itemBuilder: (context, index) {
        var favoriteCity = favoriteCityProvider.favoriteCities[index];
        return FavoriteCityCell(
          favoriteCity: favoriteCity,
          cellDidTap: () => viewModel.getWeatherData(favoriteCity.name),
          deleteIconButtonDidPress: () => favoriteCityProvider.deleteFavoriteCity(favoriteCity),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 4),
    );
  }
}
