import 'dart:convert';


import 'package:flight_reminder/database/repositories/results/forgot_result.dart';
import 'package:flight_reminder/database/repositories/results/login_result.dart';
import 'package:flight_reminder/database/repositories/results/registration_result.dart';
import 'package:flight_reminder/database/repositories/terms_repository.dart/terms_result.dart';
import 'package:flight_reminder/repositories/flight_repository/flight_result.dart';
import 'package:flight_reminder/services/i_http_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:connectivity_plus/connectivity_plus.dart';

class HttpClient implements IHttpClient {
  final _client = http.Client();

  @override
  Future<LoginResult> login(
      {required String url,
      required String email,
      required String password}) async {
    if (await hasInternetConnection()) {
      try {
        var response = await _client
            .post(Uri.parse(url),
                headers: <String, String>{
                     'accept': '*/*', // Accept any content type
                    'Content-Type': 'application/json; charset=UTF-8',
                
                },
                body: convert.jsonEncode(
                    <String, String>{'email': email, 'password': password}))
            .timeout(const Duration(seconds: 60));

        if (response.statusCode == 200) {
          Map<String, dynamic> map =
              convert.jsonDecode(response.body) as Map<String, dynamic>;

          return LoginResult(status: LoginStatus.success, result: map);
        } else if (response.statusCode == 400 || response.statusCode == 401) {
          if (response.body == 'User email does not exist in system') {
            return LoginResult(status: LoginStatus.userDoesNotExist);
          } else {
            return LoginResult(status: LoginStatus.invalidCredentials);
          }
        } else {
          return LoginResult(status: LoginStatus.serverError);
        }
      } catch (e) {
        return LoginResult(status: LoginStatus.unknownError);
      }
    } else {
      return LoginResult(status: LoginStatus.noNetwork);
    }
  }

  @override
  Future<RegistrationResult> register(
      {required String url,
      required String firstName,
      required String lastName,
      required String email,
      required String address,
      required String password}) async {
    if (await hasInternetConnection()) {
      try {
        var response = await _client
            .post(Uri.parse(url),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                  //'ApiKey': '23xygTHtysafvv2!quyHAe78K',
                },
                body: convert.jsonEncode(<String, String>{
                  'first_name': firstName,
                  'last_name': lastName,
                  'email': email,
                  'address': address,
                  'password': password,
                  
                }))
            .timeout(const Duration(seconds: 60));

        if (response.statusCode == 200) {
          Map<String, dynamic> map =
              convert.jsonDecode(response.body) as Map<String, dynamic>;

          return RegistrationResult(
              status: RegistrationStatus.success, result: map);
        } else if (response.statusCode == 401) {
          return RegistrationResult(status: RegistrationStatus.unknownError);
        } else {
          return RegistrationResult(status: RegistrationStatus.serverError);
        }
      } catch (e) {
        return RegistrationResult(status: RegistrationStatus.unknownError);
      }
    } else {
      return RegistrationResult(status: RegistrationStatus.noNetwork);
    }
  }




  @override
  Future<ForgotResult> forgotPassword({required String url, required String email}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

 @override
  Future<TermsResult> getTermsAndConditions({required String url}) async {
    if (await hasInternetConnection()) {
      try {
        var response = await _client.get(Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            //  'ApiKey': '23xygTHtysafvv2!quyHAe78K',
            });

        if (response.statusCode == 200) {
          const String bodyStyles =
              '<body bgcolor="#24324C" style="color:#ffff" !important ><header><meta name=\'viewport\' content=\'width=device-width, initial-scale=0.8, maximum-scale=0.8, minimum-scale=0.8, user-scalable=no\'></header> </br> </br>';

          Map<String, dynamic> map =
              convert.jsonDecode(response.body) as Map<String, dynamic>;

          String terms = bodyStyles + map['content'];

          return TermsResult(status: TermStatus.success, result: terms);
        } else if (response.statusCode == 401) {
          return TermsResult(status: TermStatus.unknownError);
        } else {
          return TermsResult(status: TermStatus.unknownError);
        }
      } catch (e) {
        return TermsResult(status: TermStatus.unknownError);
      }
    } else {
      return TermsResult(status: TermStatus.unknownError);
    }
  }
  @override
  Future<bool> hasInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile;
  }


Future<FlightResult> getFlights({
 // required String token,
  required String url,
}) async {
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $token',
        // 'ApiKey': '23xygTHtysafvv2!quyHAe78K', 
      },
    ).timeout(const Duration(seconds: 60));

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of articles
      List<dynamic> articlesJson = json.decode(response.body);
      // List<ArticleDto?> articles = articlesJson
      //     .map((articleJson) => ArticleDto.fromJson(articleJson))
      //     .toList();

      return FlightResult(status: FlightStatus.success, result: articlesJson);
    } else if (response.statusCode == 401) {
      return FlightResult(status: FlightStatus.unauthorized);
    } else {
      return FlightResult(status: FlightStatus.serverError);
    }
  } catch (e) {
    return FlightResult(status: FlightStatus.unknownError);
  }
}

//done
Future<FlightResult> addFlights({required String airportName, // Replace with airport name
    required String departureLocation, // Replace with departure location
    required String destination, // Replace with destination
    required String departureTime, // Replace with departure time
    required String arrivalTime, // Replace with arrival time
    required String flightDate, // Replace with flight date
    required String departureDate, // Replace with departure date
    required String arrivalDate, // Replace with arrival date
    required String ticketNumber,required String url}) async {
  try {
    final body = jsonEncode({
        "airportName": airportName,
        "departureLocation": departureLocation,
        "destination": destination,
        "departureTime": departureTime,
        "arrivalTime": arrivalTime,
        "flightDate": flightDate,
        "departureDate": departureDate,
        "arrivalDate": arrivalDate,
        "ticketNumber": ticketNumber,
  });
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
       // 'Authorization': 'Bearer $token',
       // 'ApiKey': '23xygTHtysafvv2!quyHAe78K', 
      },
      body: body,
    ).timeout(const Duration(seconds: 60));

 if (response.statusCode == 200) {
      // Parse the JSON response into a list of articles
    Map<String, dynamic> map =
              convert.jsonDecode(response.body) as Map<String, dynamic>;

      return FlightResult(status: FlightStatus.success, result: map);
    } else if (response.statusCode == 401) {
      return FlightResult(status: FlightStatus.unauthorized);
    } else {
      return FlightResult(status: FlightStatus.serverError);
    }
  } catch (e) {
    return FlightResult(status: FlightStatus.unknownError);
  }
}

//done
  @override
  Future<FlightResult> editFlight({required int id,required String url}) async {
  try {
    final body = jsonEncode({
    // 'content': content,
    // 'articleId': articleId,
    'id':id
  });
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      //  'Authorization': 'Bearer $token',
        'ApiKey': '23xygTHtysafvv2!quyHAe78K', 
      },
      body: body,
    ).timeout(const Duration(seconds: 60));

 if (response.statusCode == 200) {
      // Parse the JSON response into a list of articles
       Map<String, dynamic> map =
              convert.jsonDecode(response.body) as Map<String, dynamic>;

        
  
      return FlightResult(status: FlightStatus.success, result: map);
    } else if (response.statusCode == 401) {
      return FlightResult(status: FlightStatus.unauthorized);
    } else {
      return FlightResult(status: FlightStatus.serverError);
    }
  } catch (e) {
    return FlightResult(status: FlightStatus.unknownError);
  }
  }
  

  @override
  Future<FlightResult> getFlight({required int flightId, required String url}) async {
  try {
    final response = await http.get(
      Uri.parse(url +'?id=$flightId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $token',
        // 'ApiKey': '23xygTHtysafvv2!quyHAe78K', 
      },
    ).timeout(const Duration(seconds: 60));

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of articles
      List<dynamic> articlesJson = json.decode(response.body);

      return FlightResult(status: FlightStatus.success, result: articlesJson);
    } else if (response.statusCode == 401) {
      return FlightResult(status: FlightStatus.unauthorized);
    } else {
      return FlightResult(status: FlightStatus.serverError);
    }
  } catch (e) {
    return FlightResult(status: FlightStatus.unknownError);
  }
  }
  
  //done
  @override
  Future<FlightResult> addLikesToArticle({required int articleId, required String token, required String url}) async {
  try {
    final response = await http.patch(
      Uri.parse(url +'?articleId=$articleId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
        'ApiKey': '23xygTHtysafvv2!quyHAe78K', 
      },
    ).timeout(const Duration(seconds: 60));

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of articles
      List<dynamic> articlesJson = json.decode(response.body);
      return FlightResult(status: FlightStatus.success, result: articlesJson);
    } else if (response.statusCode == 401) {
      return FlightResult(status: FlightStatus.unauthorized);
    } else {
      return FlightResult(status: FlightStatus.serverError);
    }
  } catch (e) {
    return FlightResult(status: FlightStatus.unknownError);
  }
  }

  //done
  @override
  Future<FlightResult> deleteFlight({required int id, required String url}) async {
  try {
    final response = await http.delete(
      Uri.parse(url +'/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $token',
        // 'ApiKey': '23xygTHtysafvv2!quyHAe78K', 
      },
    ).timeout(const Duration(seconds: 60));

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of articles
      List<dynamic> articlesJson = json.decode(response.body);

      return FlightResult(status: FlightStatus.success, result: articlesJson);
    } else if (response.statusCode == 401) {
      return FlightResult(status: FlightStatus.unauthorized);
    } else {
      return FlightResult(status: FlightStatus.serverError);
    }
  } catch (e) {
    return FlightResult(status: FlightStatus.unknownError);
  }
  }
  
  @override
  Future<FlightResult> deleteLike({required int id, required String token, required String url}) async {
  try {
     var path = '$url?id=$id';
    final response = await http.patch(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
        'ApiKey': '23xygTHtysafvv2!quyHAe78K', 
      },
    ).timeout(const Duration(seconds: 60));

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of articles
      List<dynamic> articlesJson = json.decode(response.body);
      // List<ArticleDto?> articles = articlesJson
      //     .map((articleJson) => ArticleDto.fromJson(articleJson))
      //     .toList();

      return FlightResult(status: FlightStatus.success, result: articlesJson);
    } else if (response.statusCode == 401) {
      return FlightResult(status: FlightStatus.unauthorized);
    } else {
      return FlightResult(status: FlightStatus.serverError);
    }
  } catch (e) {
    return FlightResult(status: FlightStatus.unknownError);
  }
  }
  

  
  @override
  Future<FlightResult> getUserLike({required int id, required String token, required String url}) async {
    try {
    final response = await http.get(
      Uri.parse(url +'?articleId=$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
        'ApiKey': '23xygTHtysafvv2!quyHAe78K', 
      },
    ).timeout(const Duration(seconds: 60));

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of articles
      List<dynamic> articlesJson = json.decode(response.body);

      return FlightResult(status: FlightStatus.success, result: articlesJson);
    } else if (response.statusCode == 401) {
      return FlightResult(status: FlightStatus.unauthorized);
    } else {
      return FlightResult(status: FlightStatus.serverError);
    }
  } catch (e) {
    return FlightResult(status: FlightStatus.unknownError);
  }
  }
}
