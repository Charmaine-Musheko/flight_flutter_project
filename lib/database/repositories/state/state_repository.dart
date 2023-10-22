

import 'package:flight_reminder/database/i_database_provider.dart';
import 'package:flight_reminder/database/repositories/state/constants.dart';
import 'package:flight_reminder/database/repositories/user_repository/user_repository.dart';
import 'package:flight_reminder/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:flight_reminder/screens/flights/flight_screen.dart';
import 'package:flight_reminder/screens/onboarding/get_started_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class StateRepository {
  final Future<SharedPreferences> _prefs;
  final UserRepository _userRepository;
  final IDatabaseProvider _databaseProvider;

  StateRepository(
      {required Future<SharedPreferences> prefs,
      required UserRepository userRepository,
      required IDatabaseProvider databaseProvider})
      : _prefs = prefs,
        _userRepository = userRepository,
        _databaseProvider = databaseProvider;

  bool isLoggingOut = false;

  void setDidOnboarding() {
    _prefs.then((value) => value.setBool(kDidOnBoarding, true));
  }

  void setDidLogin() {
    _prefs.then((value) => value.setBool(kDidLogin, true));
  }

  Future<String> getInitialRoute() async {
    String initialRoute = GetStartedScreen.routeName;

    await _prefs.then((value) {
      bool? didLogin = value.getBool(kDidLogin);

      if (didLogin ?? false) {
        initialRoute = FlightScreen.routeName;
      } else {
        bool? didOnBoarding = value.getBool(kDidOnBoarding);

        if (didOnBoarding ?? false) {
          initialRoute = SignInScreen.routeName;
        }
      }
    }).onError((error, stackTrace) {
      initialRoute = GetStartedScreen.routeName;
    });

    return initialRoute;
  }

  Future<void> logout() async {
    isLoggingOut = true;

   // await _userRepository.unsubscribeFromFirebaseMessaging();

    SharedPreferences preference = await SharedPreferences.getInstance();
    await preference.clear();

    await _databaseProvider.deleteDb();
    
    
  }
}
