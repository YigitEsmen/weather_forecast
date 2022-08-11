import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../about/about_view.dart';
import '../favorites/favorites_view.dart';
import '../settings/settings_view.dart';

enum WeatherMenu { favorites, about, settings }

class WeatherPopupMenuButton extends StatelessWidget {
  const WeatherPopupMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (WeatherMenu weatherMenu) {
        late String routeName;
        switch (weatherMenu) {
          case WeatherMenu.favorites:
            routeName = FavoritesView.routeName;
            break;
          case WeatherMenu.about:
            routeName = AboutView.routeName;
            break;
          default:
            routeName = SettingsView.routeName;
        }
        Navigator.pushNamed(context, routeName);
      },
      itemBuilder: (context) => <PopupMenuEntry<WeatherMenu>>[
        PopupMenuItem<WeatherMenu>(
          value: WeatherMenu.favorites,
          child: buildPopupMenuRow(
            iconData: Icons.favorite_border,
            text: Constants.favorites,
          ),
        ),
        PopupMenuItem<WeatherMenu>(
          value: WeatherMenu.about,
          child: buildPopupMenuRow(
            iconData: Icons.info,
            text: Constants.about,
          ),
        ),
        PopupMenuItem<WeatherMenu>(
          value: WeatherMenu.settings,
          child: buildPopupMenuRow(
            iconData: Icons.settings,
            text: Constants.settings,
          ),
        ),
      ],
    );
  }

  Widget buildPopupMenuRow({
    required IconData iconData,
    required String text,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData),
        const SizedBox(width: 16),
        Text(text),
      ],
    );
  }
}
