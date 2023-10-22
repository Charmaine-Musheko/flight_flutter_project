
import 'package:flight_reminder/locator.dart';
import 'package:flight_reminder/repositories/flight_repository/flight_result.dart';
import 'package:flight_reminder/services/dtos/flight_dto.dart';
import 'package:flight_reminder/services/i_http_client.dart';
import 'package:flight_reminder/services/url_constants.dart';

class FlightRepository {
  final IHttpClient _client = locator<IHttpClient>();
//  final UserRepository _userRepository = locator<UserRepository>();

//Get Flights from the server
Future<List<FlightDto?>> getFromServer() async {


  FlightResult result = await _client.getFlights( url: AppUrl.getFlights);

  if (result.status == FlightStatus.success) {
    // Check if result.result is a List of JSON objects
    if (result.result is List<dynamic>) {
      try {
       List<FlightDto?> articles = (result.result as List<dynamic>)
    .map((articleData) {
      try {
        return FlightDto.fromJson(articleData);
      } catch (e) {
        print("JSON Parsing Error: $e");
        return null;
      }
    })
    .toList();


        return articles;
      } catch (e) {
        print("JSON Parsing Error: $e");
        return [];
      }
    } else {
      // Handle the case where result.result is not a List of JSON objects
      print("API Error: Unexpected response format");
      return [];
    }
  } else if (result.status == FlightStatus.unauthorized) {
    // Handle unauthorized error
    print("API Error: Unauthorized");
    return [];
  } else if (result.status == FlightStatus.serverError) {
    // Handle server error
    print("API Error: Server Error");
    return [];
  } else {
    // Handle other error cases or unknown error
    print("API Error: Unknown Error");
    return [];
  }
}
Future<List<FlightDto?>> getByIdFromServer(int id ) async {


  FlightResult result = await _client.getFlight(flightId: id, url: AppUrl.getFlight);

  if (result.status == FlightStatus.success) {
    // Check if result.result is a List of JSON objects
    if (result.result is List<dynamic>) {
      try {
       List<FlightDto?> flight = (result.result as List<dynamic>)
    .map((flightData) {
      try {
        return FlightDto.fromJson(flightData);
      } catch (e) {
        print("JSON Parsing Error: $e");
        return null;
      }
    })
    .toList();


        return flight;
      } catch (e) {
        print("JSON Parsing Error: $e");
        return [];
      }
    } else {
      // Handle the case where result.result is not a List of JSON objects
      print("API Error: Unexpected response format");
      return [];
    }
  } else if (result.status == FlightStatus.unauthorized) {
    // Handle unauthorized error
    print("API Error: Unauthorized");
    return [];
  } else if (result.status == FlightStatus.serverError) {
    // Handle server error
    print("API Error: Server Error");
    return [];
  } else {
    // Handle other error cases or unknown error
    print("API Error: Unknown Error");
    return [];
  }
}
//Post to the server
Future<List<FlightDto?>> postFlight(String airportName,String departureLocation, String destination , String departureTime, String arrivalTime, String flightDate, String departureDate,String arrivalDate, String ticketNumber) async {
 FlightResult result = await _client.addFlights(url: AppUrl.addFlight, airportName: airportName, departureLocation: departureDate, destination: destination, departureTime: departureTime, arrivalTime: arrivalTime, flightDate: flightDate, departureDate: departureDate, arrivalDate: arrivalDate, ticketNumber: ticketNumber);

  if (result.status == FlightStatus.success) {
    // Check if result.result is a List of JSON objects
    if (result.result is List<dynamic>) {
      try {
       List<FlightDto?> flights = (result.result as List<dynamic>)
    .map((flightData) {
      try {
        return FlightDto.fromJson(flightData);
      } catch (e) {
        print("JSON Parsing Error: $e");
        return null;
      }
    })
    .toList();


        return flights;
      } catch (e) {
        print("JSON Parsing Error: $e");
        return [];
      }
    } else {
      // Handle the case where result.result is not a List of JSON objects
      print("API Error: Unexpected response format");
      return [];
    }
  } else if (result.status == FlightStatus.unauthorized) {
    // Handle unauthorized error
    print("API Error: Unauthorized");
    return [];
  } else if (result.status == FlightStatus.serverError) {
    // Handle server error
    print("API Error: Server Error");
    return [];
  } else {
    // Handle other error cases or unknown error
    print("API Error: Unknown Error");
    return [];
  }
}
//Get from the server
Future<List<FlightDto?>> editFlight(int articleId, int id, String content) async {


  FlightResult result = await _client.editFlight(id:id, url: AppUrl.editFlight);

  if (result.status == FlightStatus.success) {
    // Check if result.result is a List of JSON objects
    if (result.result is List<dynamic>) {
      try {
       List<FlightDto?> flights = (result.result as List<dynamic>)
    .map((flightData) {
      try {
        return FlightDto.fromJson(flightData);
      } catch (e) {
        print("JSON Parsing Error: $e");
        return null;
      }
    })
    .toList();


        return flights;
      } catch (e) {
        print("JSON Parsing Error: $e");
        return [];
      }
    } else {
      // Handle the case where result.result is not a List of JSON objects
      print("API Error: Unexpected response format");
      return [];
    }
  } else if (result.status == FlightStatus.unauthorized) {
    // Handle unauthorized error
    print("API Error: Unauthorized");
    return [];
  } else if (result.status == FlightStatus.serverError) {
    // Handle server error
    print("API Error: Server Error");
    return [];
  } else {
    // Handle other error cases or unknown error
    print("API Error: Unknown Error");
    return [];
  }
}
//Get from the server
Future<List<FlightDto?>> deleteFlightFromServer(int id) async {


  FlightResult result = await _client.deleteFlight(id: id, url: AppUrl.deleteFlight);

  if (result.status == FlightStatus.success) {
    // Check if result.result is a List of JSON objects
    if (result.result is List<dynamic>) {
      try {
       List<FlightDto?> comments = (result.result as List<dynamic>)
    .map((articleData) {
      try {
        return FlightDto.fromJson(articleData);
      } catch (e) {
        print("JSON Parsing Error: $e");
        return null;
      }
    })
    .toList();


        return comments;
      } catch (e) {
        print("JSON Parsing Error: $e");
        return [];
      }
    } else {
      // Handle the case where result.result is not a List of JSON objects
      print("API Error: Unexpected response format");
      return [];
    }
  } else if (result.status == FlightStatus.unauthorized) {
    // Handle unauthorized error
    print("API Error: Unauthorized");
    return [];
  } else if (result.status == FlightStatus.serverError) {
    // Handle server error
    print("API Error: Server Error");
    return [];
  } else {
    // Handle other error cases or unknown error
    print("API Error: Unknown Error");
    return [];
  }
} 


}