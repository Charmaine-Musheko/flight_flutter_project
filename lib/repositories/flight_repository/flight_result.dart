
import 'package:flight_reminder/database/repositories/results/network_result.dart';

class FlightResult extends NetworkResult {

  FlightResult({ required status, result}) : super(status: status, result: result);

    final Map<FlightStatus, String> _message = {
    FlightStatus.success: 'Success',
    FlightStatus.unknownError: 'Unknown Error. Please try again',
    FlightStatus.emptyInput: 'No empty fields allowed',
    FlightStatus.unableToSave: 'Unable to save. Please try again',
    FlightStatus.unableToDelete: 'Unable to delete. Please try again',
    FlightStatus.unauthorized: 'Unautharized',
    FlightStatus.serverError: 'Server error',
    FlightStatus.noInternet: 'No internet connection available. Please try again'
  };

  @override
  String getMessage() {
    return _message[status]!;
  }
}

enum FlightStatus { success, unknownError, emptyInput, unableToSave, unableToDelete,unauthorized, serverError, noInternet }