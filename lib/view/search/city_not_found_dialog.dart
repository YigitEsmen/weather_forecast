import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CityNotFoundDialog extends StatelessWidget {
  const CityNotFoundDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: const Text(Constants.cityNotFoundDialogTitle),
            content: const Text(Constants.cityNotFoundDialogContent),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(Constants.ok),
              ),
            ],
          )
        : AlertDialog(
            title: const Text(Constants.cityNotFoundDialogTitle),
            content: const Text(Constants.cityNotFoundDialogContent),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  Constants.ok,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
  }
}
