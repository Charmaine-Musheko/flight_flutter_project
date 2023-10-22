
import 'package:encrypt/encrypt.dart';
import 'package:flight_reminder/database/repositories/state/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EncryptionUtil {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

}
