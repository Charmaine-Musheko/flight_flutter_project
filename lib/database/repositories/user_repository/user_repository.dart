
import 'package:flight_reminder/database/data_repositories/user_data_repository.dart';
import 'package:flight_reminder/database/model/entities/user.dart';
import 'package:flight_reminder/database/repositories/results/forgot_result.dart';
import 'package:flight_reminder/database/repositories/results/login_result.dart';
import 'package:flight_reminder/database/repositories/results/registration_result.dart';
import 'package:flight_reminder/database/repositories/results/verify_phone_result.dart';
import 'package:flight_reminder/services/i_http_client.dart';
import 'package:flight_reminder/services/url_constants.dart';
import 'package:flight_reminder/utils/encryption_util.dart';
import 'package:flight_reminder/utils/validator.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  final IHttpClient _httpClient;
  final UserDataRepository _userDataRepository;
  final EncryptionUtil _encryptionUtil;

  UserRepository(
      {required IHttpClient httpClient,
      required UserDataRepository userDataRepository,
      required EncryptionUtil encryptionUtil})
      : _httpClient = httpClient,
        _userDataRepository = userDataRepository,
        _encryptionUtil = encryptionUtil;

  Future<LoginResult> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return LoginResult(status: LoginStatus.emptyInput);
    }

    if (!Validator.isValidEmail(email)) {
      return LoginResult(status: LoginStatus.invalidEmail);
    }

    return await _httpClient.login(
        url: AppUrl.login, email: email, password: password);
  }




  Future<RegistrationResult> register(String firstName, String lastName,
      String email,  String address, String password) async {
    return await _httpClient.register(
        url: AppUrl.register,
        firstName: firstName,
        lastName: lastName,
        address: address,
        email: email,
        password: password,
        );
  }






  Future<ForgotResult> forgotPassword(String email) async {
    if (email.isEmpty) {
      return ForgotResult(status: ForgotStatus.emptyInput);
    }

    if (!Validator.isValidEmail(email)) {
      return ForgotResult(status: ForgotStatus.invalidEmail);
    }

    return await _httpClient.forgotPassword(
        url: AppUrl.forgotPassword, email: email);
  }

  Future<User?> getUser() async {
    return await _userDataRepository.get();
  }

Future<int> getUserId() async {
  User? user = await _userDataRepository.get();

  if (user != null) {
    return await user.id;
  }

  return 0; // You can choose a default value (e.g., 0) if the user doesn't exist.
}
// Future<User?> getUserById(int userId) async {
//   return await _userDataRepository.exists(userId);

// }


  Future<int> insertUser(User user) async {
    int result = await _userDataRepository.insert(user);

    // if (result != 0) {
    //   //Subscribe to topic
    //   try {
    //     await FirebaseMessaging.instance.subscribeToTopic(user.id);
    //   } catch (e) {
    //     if (kDebugMode) {
    //       print(e);
    //       //TODO: Record state of not subscribed
    //     }
    //   }
    // }

    return result;
  }

  Future<User?> updateProfile(int id,  String email) async {
    return await _userDataRepository.update(
        id,  email);
  }

  // Future<void> unsubscribeFromFirebaseMessaging() async {
  //   var user = await getUser();

  //   if (user != null) {
  //     await FirebaseMessaging.instance.unsubscribeFromTopic(user.id);
  //   }
  // }
}

