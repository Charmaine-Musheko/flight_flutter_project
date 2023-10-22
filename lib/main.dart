import 'package:flight_reminder/database/repositories/state/state_repository.dart';
import 'package:flight_reminder/locator.dart';
import 'package:flutter/material.dart';

import 'screens/app.dart';
import 'screens/settings/settings_controller.dart';
import 'screens/settings/settings_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setup();


  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  Future<String> initialRoute() async {
    StateRepository repo = locator<StateRepository>();
    return await repo.getInitialRoute();
  }

  runApp(FlightReminderApp(
    initialRoute: await initialRoute(),
  ));
}
