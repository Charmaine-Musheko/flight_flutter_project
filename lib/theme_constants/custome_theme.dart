

import 'package:flight_reminder/database/repositories/state/state_repository.dart';
import 'package:flight_reminder/dialogs/custom_standard_dialog.dart';
import 'package:flight_reminder/locator.dart';
import 'package:flight_reminder/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:flight_reminder/theme_constants/colours.dart';
import 'package:flight_reminder/theme_constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  static AppBar? _clearAppBar;

  static ThemeData setTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Roboto',
      appBarTheme: _getAppBarTheme(),
    );
  }

  static AppBar clearAppBar() {
    return _clearAppBar ??= AppBar(
      backgroundColor: Colors.transparent,
      titleTextStyle: kLargeAppTitle,
      elevation: 0,
    );
  }
 

  static AppBar appBar(
      {String title = '', BuildContext? context, bool showProfile = false}) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title),
      titleTextStyle: kLargeAppTitle,
      elevation: 0,
      actions: showProfile
          ? [
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: kPlaceHolderColor,
                ),
                onPressed: () {
                  if (context != null) {
                   // Navigator.pushNamed(context);
                  }
                },
              ),
            ]
          : [],
    );
  }


  static double clearAppBarHeight() {
    AppBar bar = clearAppBar();
    return bar.preferredSize.height;
  }

  static double appBarHeight() {
    AppBar bar = appBar();
    return bar.preferredSize.height;
  }

  static AppBarTheme _getAppBarTheme() {
    return const AppBarTheme(
        color: kMain,
        elevation: 1,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: kLargeAppTitle);
  }

static Drawer drawer(BuildContext context) {
  return Drawer(
    elevation: 16,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        const SizedBox(
          height: 48,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.close),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Text(
          'Menu',
          style: kArticleTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 48,
        ),
       
        const Spacer(),
        ListTile(
          title: const Text(
            'Log Out',
            style: kFlightetails,
            textAlign: TextAlign.center,
          ),
          onTap: () async {
            CustomStandardDialog().showYesNoDialog(
                context, 'Are you sure you want to log out?', (value) async {
              if (value) {
                // Update the state of the app
                StateRepository repo = locator<StateRepository>();
                await repo.logout();
                if (Navigator.canPop(context)) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, SignInScreen.routeName, (route) => false);
                } else {
                  Navigator.pop(context);
                }
              } else {
                Navigator.pop(context);
              }
            });
          },
        ),
        const SizedBox(
          height: 24,
        )
      ],
    ),
  );
}
}