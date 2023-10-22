

import 'package:flight_reminder/database/repositories/results/forgot_result.dart';
import 'package:flight_reminder/database/repositories/results/login_result.dart';
import 'package:flight_reminder/database/repositories/results/registration_result.dart';
import 'package:flight_reminder/database/repositories/terms_repository.dart/terms_result.dart';
import 'package:flight_reminder/repositories/flight_repository/flight_result.dart';

abstract class IHttpClient {
  Future<bool> hasInternetConnection();

  Future<TermsResult> getTermsAndConditions({required String url});

  Future<LoginResult> login(
      {required String url, required String email, required String password});

  Future<ForgotResult> forgotPassword(
      {required String url, required String email});

  Future<RegistrationResult> register(
      {required String url,
      required String firstName,
      required String lastName,
      required String email,
      required String address,
      required String password});



  Future<FlightResult> getFlights(
      {required String url});



  Future<FlightResult> addFlights(
    {required String url, // URL for the API endpoint // Replace with actual flight ID
    required String airportName, // Replace with airport name
    required String departureLocation, // Replace with departure location
    required String destination, // Replace with destination
    required String departureTime, // Replace with departure time
    required String arrivalTime, // Replace with arrival time
    required String flightDate, // Replace with flight date
    required String departureDate, // Replace with departure date
    required String arrivalDate, // Replace with arrival date
    required String ticketNumber // Replace with ticket number
    });

  
   Future<FlightResult> getFlight(
      {required int flightId, required String url});



   Future<FlightResult> deleteFlight(
      {required int id, required String url});
    
    Future<FlightResult> editFlight(
      {required int id, required String url});
  

    


}
