
import 'package:flight_reminder/database/repositories/results/network_result.dart';

class ForgotResult extends NetworkResult {

  ForgotResult({ required status, result}) : super(status: status, result: result);

    final Map<ForgotStatus, String> _message = {
    ForgotStatus.success: 'Success',
    ForgotStatus.invalidUser: 'Invalid User',
    ForgotStatus.emptyInput: 'Please add an email address',
    ForgotStatus.unknownError: 'Unknown Error. Please try again',
    ForgotStatus.invalidEmail: 'Invalid Email. Please add a valid email address',
    ForgotStatus.noNetwork: 'No Network. Please make sure you are connected to the internet',
    ForgotStatus.serverError: 'An error occurred. Please try again later.',
    ForgotStatus.userDoesNotExist: 'User does not exist. Please create account',
  };

  @override
  String getMessage() {
    return _message[status]!;
  }
}

enum ForgotStatus { success, invalidUser, unknownError, emptyInput, invalidEmail, noNetwork, serverError, userDoesNotExist }