

import 'package:flight_reminder/database/repositories/results/network_result.dart';

class LoginResult extends NetworkResult {
  LoginResult({required status, result})
      : super(status: status, result: result);

  static final Map<LoginStatus, String> _message = {
    LoginStatus.success: 'Success',
    LoginStatus.serverError: 'An error occurred. Please try again later.',
    LoginStatus.invalidCredentials: 'Invalid credentials',
    LoginStatus.unknownError: 'Unknown error occurred. Please try again later.',
    LoginStatus.emptyInput: 'No empty fields allowed',
    LoginStatus.invalidEmail: 'Invalid Email. Please add a valid email address',
    LoginStatus.timeout: 'Network timeout. Please try again later',
    LoginStatus.noNetwork:
        'No Network. Please make sure you are connected to the internet',
    LoginStatus.userDoesNotExist:
        'User does not exist. Please register'
  };

  @override
  String getMessage() {
    return _message[status]!;
  }
}

enum LoginStatus {
  success,
  serverError,
  invalidCredentials,
  unknownError,
  emptyInput,
  invalidEmail,
  timeout,
  noNetwork,
  userDoesNotExist
}
