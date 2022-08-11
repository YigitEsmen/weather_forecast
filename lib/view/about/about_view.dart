import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/url_launcher.dart';
import 'social_media_button.dart';

class AboutView extends StatelessWidget {
  static const routeName = '/about-view';
  final String _upworkIcon = 'upwork_icon.png';
  final String _gitHubIconLight = 'github_icon_for_light_mode.png';
  final String _gitHubIconDark = 'github_icon_for_dark_mode.png';
  final String _twitterIcon = 'twitter_icon.png';
  final String _yigitsUpworkUrl = 'https://www.upwork.com/freelancers/~01287ff8752ab7a217';
  final String _yigitsGithubUrl = 'https://github.com/yigitesmen';
  final String _yigitsTwitterUrl = 'https://twitter.com/YigitEsmen';

  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text(Constants.about)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildAppInfo(context),
            const SizedBox(height: 12),
            buildApiInfo(context),
            const SizedBox(height: 12),
            buildDeveloperInfo(context),
            const SizedBox(height: 12),
            buildSocialMediaRow(isDarkMode),
          ],
        ),
      ),
    );
  }

  Text buildAppInfo(BuildContext context) {
    return Text(
      '${Constants.appName} ${Constants.version}',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Text buildApiInfo(BuildContext context) {
    return Text(
      Constants.weatherApiBy,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  Text buildDeveloperInfo(BuildContext context) {
    return Text(
      Constants.developerInfo,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  Row buildSocialMediaRow(bool isDarkMode) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialMediaButton(
          icon: _upworkIcon,
          onTap: () => UrlLauncher.launch(_yigitsUpworkUrl),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SocialMediaButton(
            icon: isDarkMode ? _gitHubIconDark : _gitHubIconLight,
            onTap: () => UrlLauncher.launch(_yigitsGithubUrl),
          ),
        ),
        SocialMediaButton(
          icon: _twitterIcon,
          onTap: () => UrlLauncher.launch(_yigitsTwitterUrl),
        ),
      ],
    );
  }
}
