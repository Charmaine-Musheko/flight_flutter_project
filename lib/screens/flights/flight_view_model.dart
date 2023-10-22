import 'package:flight_reminder/base/base_view_model.dart';
import 'package:flight_reminder/locator.dart';
import 'package:flight_reminder/repositories/flight_repository/flight_repository.dart';
import 'package:flight_reminder/repositories/flight_repository/flight_result.dart';
import 'package:flight_reminder/services/dtos/flight_dto.dart';

class FlightViewModel extends BaseViewModel {

  final FlightRepository _repo = locator<FlightRepository>();
 // final UserRepository _userRepository = locator<UserRepository>();

 Future<List<FlightDto?>> get() async {

    viewIsLoading(true);

    List<FlightDto?> result = await _repo.getFromServer();

    viewIsLoading(false);

    return result;
  } 
  Future<List<FlightDto?>> deleteFlight(int id) async {

    viewIsLoading(true);

    List<FlightDto?> result = await _repo.deleteFlightFromServer(id);

    viewIsLoading(false);

    return result;
  } 

Future<FlightResult> saveFlight(
  String airportName,
  String departureLocation,
  String destination,
  String departureTime,
  String arrivalTime,
  String flightDate,
  String departureDate,
  String arrivalDate,
  String ticketNumber) async {
  try {
    //Notify listeners to add loading view
    viewIsLoading(true);

    List<FlightDto?> flightDtoList = await _repo.postFlight(
      airportName,
     departureLocation,
       destination,
     departureTime,
       arrivalTime,
       flightDate,
       departureDate,
       arrivalDate,
      ticketNumber
    );

    //Notify listeners to remove loading view
    viewIsLoading(false);

    if (flightDtoList != null) {
      // Handle the list of FlightDto as needed
      // You can convert it to a FlightResult or handle it separately
      // For example:
      return FlightResult(status: FlightStatus.success, result: flightDtoList);
    } else {
      // Handle the case where flightDtoList is null
      return FlightResult(status: FlightStatus.serverError);
    }
  } catch (e) {
    // Handle errors and return an appropriate FlightResult
    return FlightResult(status: FlightStatus.serverError);
  }
}




//  Future<User?> getUser() async {
//     return await _userRepository.getUser();
//   }
}