import 'dart:io';

import 'package:flight_reminder/helpers/function_alias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomStandardDialog {

  Future<void> _showYesNoAlertDialogAndroid(BuildContext context,
      String message, AnonymousFunctionSingleParameter function) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ALERT'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('NO'),
              onPressed: () {
                function(false);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('YES'),
              onPressed: () {
                function(true);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  Future<void> _showYesNoAlertDialogIos(BuildContext context, String message,
      AnonymousFunctionSingleParameter function) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('ALERT'),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('NO'),
              onPressed: () {
                function(false);
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('YES'),
              onPressed: () {
                function(true);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showYesNoDialog(
      BuildContext context, String message, AnonymousFunctionSingleParameter function) {
    if (Platform.isIOS) {
      _showYesNoAlertDialogIos(context, message, function);
    } else {
      _showYesNoAlertDialogAndroid(context, message, function);
    }
  }
}
