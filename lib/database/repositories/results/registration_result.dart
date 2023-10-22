
import 'package:flight_reminder/database/repositories/results/network_result.dart';

class RegistrationResult extends NetworkResult {
  RegistrationResult({required status, result})
      : super(status: status, result: result);

  static final Map<RegistrationStatus, String> _message = {
    RegistrationStatus.success: 'Success',
    RegistrationStatus.serverError:
        'An error occurred. Please try again later.',
    RegistrationStatus.unknownError:
        'Unknown error occurred. Please try again later.',
    RegistrationStatus.timeout: 'Network timeout. Please try again later',
    RegistrationStatus.noNetwork:
        'No Network. Please make sure you are connected to the internet'
  };

  @override
  String getMessage() {
    return _message[status]!;
  }
}

enum RegistrationStatus {
  success,
  serverError,
  unknownError,
  timeout,
  noNetwork,
}
