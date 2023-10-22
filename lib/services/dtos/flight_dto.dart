class FlightDto {
  final int flightId;
  final String airportName;
  final String departureLocation;
  final String destination;
  final String departureTime;
  final String arrivalTime;
  final String flightDate;
  final String departureDate;
  final String arrivalDate;
  final String ticketNumber;

  FlightDto({
    required this.flightId,
    required this.airportName,
    required this.departureLocation,
    required this.destination,
    required this.departureTime,
    required this.arrivalTime,
    required this.flightDate,
    required this.departureDate,
    required this.arrivalDate,
    required this.ticketNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'flightId': flightId,
      'airportName': airportName,
      'departureLocation': departureLocation,
      'destination': destination,
      'departureTime': departureTime,
      'arrivalTime': arrivalTime,
      'flightDate': flightDate,
      'departureDate': departureDate,
      'arrivalDate': arrivalDate,
      'ticketNumber': ticketNumber,
    };
  }

  static FlightDto? fromJson(Map<String, dynamic>? json) {
    try {
      if (json == null) {
        return null;
      }

      return FlightDto(
        flightId: json['flightId'] ?? 0,
        airportName: json['airportName'] ?? '',
        departureLocation: json['departureLocation'] ?? '',
        destination: json['destination'] ?? '',
        departureTime: json['departureTime'] ?? '',
        arrivalTime: json['arrivalTime'] ?? '',
        flightDate: json['flightDate'] ?? '',
        departureDate: json['departureDate'] ?? '',
        arrivalDate: json['arrivalDate'] ?? '',
        ticketNumber: json['ticketNumber'] ?? '',
      );
    } catch (e) {
      print('Error in fromJson: $e');
      return null;
    }
  }
}
