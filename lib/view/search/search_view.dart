import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../../view_model/search_view_model.dart';

class SearchView extends StatelessWidget {
  static const routeName = '/search-view';
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => SearchViewModel(context),
      builder: (context, _) {
        var viewModel = Provider.of<SearchViewModel>(context, listen: false);
        return Scaffold(
          appBar: AppBar(title: const Text(Constants.search)),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: Constants.searchTextFieldLabelText,
              ),
              onSubmitted: (cityName) => viewModel.getWeatherData(cityName),
            ),
          ),
        );
      },
    );
  }
}
