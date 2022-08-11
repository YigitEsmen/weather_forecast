import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/forecast_provider.dart';
import '../utils/constants.dart';
import 'weather/weather_view.dart';

class LoadingView extends StatelessWidget {
  static const routeName = '/';

  const LoadingView({Key? key}) : super(key: key);

  Future<Widget> futureCall(BuildContext context) async {
    await Provider.of<ForecastProvider>(context, listen: false).loadVariables();
    return Future.value(const WeatherView());
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/app_icon_circle.png'),
      logoSize: 70,
      title: Text(
        Constants.appName,
        style: Theme.of(context).textTheme.headline6,
      ),
      gradientBackground: LinearGradient(
        colors: [
          Colors.blue.shade200,
          Colors.orange.shade200,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      loadingText: const Text(Constants.loading),
      showLoader: true,
      loaderColor: Theme.of(context).colorScheme.onPrimary,
      futureNavigator: futureCall(context),
    );
  }
}
