import 'dart:io';

import 'package:florist/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackDialog {
  static BackDialog _instance = new BackDialog.internal();

  BackDialog.internal();

  factory BackDialog() => _instance;

  static void showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.t(context, 'close') + ' James Wong Florist?'),
          content: Text(AppLocalizations.t(context, 'confirmExitApp')),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.t(context, 'yes')),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            TextButton(
              child: Text(AppLocalizations.t(context, 'no')),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
