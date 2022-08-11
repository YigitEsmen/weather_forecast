import 'package:flutter/material.dart';

import '../../model/city.dart';
import '../../utils/constants.dart';

class FavoriteCityCell extends StatelessWidget {
  final City favoriteCity;
  final VoidCallback cellDidTap;
  final VoidCallback deleteIconButtonDidPress;

  const FavoriteCityCell({
    Key? key,
    required this.favoriteCity,
    required this.cellDidTap,
    required this.deleteIconButtonDidPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: Constants.borderRadius,
      ),
      child: GestureDetector(
        onTap: cellDidTap,
        child: Row(
          children: [
            Expanded(
              flex: 11,
              child: buildFavoriteCityNameText(context),
            ),
            Expanded(
              flex: 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCountryCodeWidget(context),
                  buildDeleteFavoriteCityButton(),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildFavoriteCityNameText(BuildContext context) {
    return Text(
      favoriteCity.name,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  Widget buildCountryCodeWidget(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(28)),
      ),
      child: Text(
        favoriteCity.country,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  IconButton buildDeleteFavoriteCityButton() {
    return IconButton(
      onPressed: deleteIconButtonDidPress,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: const Icon(Icons.restore_from_trash),
    );
  }
}
