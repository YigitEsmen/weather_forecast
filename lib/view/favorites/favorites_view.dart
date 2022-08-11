import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../../view_model/favorites_view_model.dart';
import '../../providers/favorite_city_provider.dart';
import 'favorite_city_list_view.dart';

class FavoritesView extends StatelessWidget {
  static const routeName = '/favorites-view';
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => FavoritesViewModel(context),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(title: const Text(Constants.favoriteCities)),
          body: Consumer<FavoriteCityProvider>(
            builder: (context, favoriteCityProvider, widget) => favoriteCityProvider.favoriteCities.isEmpty
                ? const Center(child: Text(Constants.favoritesAreEmpty))
                : FavoriteCityListView(favoriteCityProvider),
          ),
        );
      },
    );
  }
}
