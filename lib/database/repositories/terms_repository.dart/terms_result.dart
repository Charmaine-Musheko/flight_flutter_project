
import 'package:flight_reminder/database/repositories/results/network_result.dart';

class TermsResult extends NetworkResult {
  TermsResult({required status, result})
      : super(status: status, result: result);

  static final Map<TermStatus, String> _message = {
    TermStatus.success: 'Success',
    TermStatus.unknownError: 'Unknown error occurred. Please try again later.',
    TermStatus.unableToRetrieve: 'Unable to load terms. Please try again later.',
  };

  @override
  String getMessage() {
    return _message[status]!;
  }
}

enum TermStatus {
  success,
  unableToRetrieve,
  unknownError
}