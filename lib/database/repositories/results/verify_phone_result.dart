
import 'package:flight_reminder/database/repositories/results/network_result.dart';

class VerifyPhoneResult extends NetworkResult {
  VerifyPhoneResult({required status, result})
      : super(status: status, result: result);

  static final Map<VerifyPhoneStatus, String> _message = {
    VerifyPhoneStatus.success: 'Success',
    VerifyPhoneStatus.serverError: 'An error occurred. Please try again later.',
    VerifyPhoneStatus.unknownError:
        'Unknown error occurred. Please try again later.',
    VerifyPhoneStatus.emptyInput: 'No empty fields allowed',
    VerifyPhoneStatus.invalidEmail:
        'Invalid Email. Please add a valid email address',
    VerifyPhoneStatus.timeout: 'Network timeout. Please try again later',
    VerifyPhoneStatus.noNetwork:
        'No Network. Please make sure you are connected to the internet',
    VerifyPhoneStatus.invalidPhoneNumber:
        'Invalid phone number. Please add a valid phone number',
    VerifyPhoneStatus.invalidFirstName:
        'Invalid first name. Please add a valid first name',
    VerifyPhoneStatus.invalidLastName:
        'Invalid last name. Please add a valid last name',
    VerifyPhoneStatus.weakPassword:
        'Weak password. Please use a stronger Password',
    VerifyPhoneStatus.phoneNumberAlreadyExists:
        'Phone number already exists. Please use login',
    VerifyPhoneStatus.unableToSendCode: 'Unable to send Code. Please try again'
  };

  @override
  String getMessage() {
    return _message[status]!;
  }
}

enum VerifyPhoneStatus {
  success,
  serverError,
  unknownError,
  emptyInput,
  invalidEmail,
  timeout,
  noNetwork,
  invalidPhoneNumber,
  invalidFirstName,
  invalidLastName,
  weakPassword,
  phoneNumberAlreadyExists,
  unableToSendCode
}
