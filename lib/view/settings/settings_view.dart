import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../../view_model/settings_view_model.dart';
import 'measurement_button.dart';
import 'save_button.dart';

class SettingsView extends StatelessWidget {
  static const routeName = '/settings-view';
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsViewModel(context),
      builder: (context, _) {
        var viewModel = Provider.of<SettingsViewModel>(context, listen: false);
        return Scaffold(
          appBar: AppBar(title: const Text(Constants.settings)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTitle(context),
                const SizedBox(height: 16),
                Consumer<SettingsViewModel>(
                  builder: (context, viewModel, widget) => MeasurementButton(
                    onTap: viewModel.changeMeasurementUnit,
                    text: viewModel.measurementUnit.toString(),
                  ),
                ),
                const SizedBox(height: 8),
                SaveButton(onPressed: viewModel.saveMeasurementUnit),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTitle(BuildContext context) {
    return Text(
      Constants.changeUnitsOfMeasurement,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
