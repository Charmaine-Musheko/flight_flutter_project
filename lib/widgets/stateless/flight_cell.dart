import 'dart:async';

import 'package:flutter/material.dart';

class FlightCell extends StatefulWidget {

  final String airportName;
  final String departureLocation;
  final String destination;
  final String departureTime;
  final String arrivalTime;
  final String flightDate;
  final String departureDate;
  final String arrivalDate;
  final String ticketNumber;

  const FlightCell({
    Key? key,
 
    required this.airportName,
    required this.departureLocation,
    required this.destination,
    required this.departureTime,
    required this.arrivalTime,
    required this.flightDate,
    required this.departureDate,
    required this.arrivalDate,
    required this.ticketNumber,
  }) : super(key: key);

  @override
  _FlightCellState createState() => _FlightCellState();
}

class _FlightCellState extends State<FlightCell> {
  late Timer _timer;
  late Duration _duration;

  @override
  void initState() {
    super.initState();
    _duration = DateTime.parse(widget.departureTime).difference(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _duration = _duration - Duration(seconds: 1);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigate to detailed page
        },
        child: ListTile(
          leading: Icon(Icons.flight),
          title: Text('Flight Details'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Airport Name: ${widget.airportName}'),
              Text('Departure Location: ${widget.departureLocation}'),
              Text('Destination: ${widget.destination}'),
              Text('Departure Time: ${widget.departureTime}'),
              Text('Arrival Time: ${widget.arrivalTime}'),
              Text('Flight Date: ${widget.flightDate}'),
              Text('Departure Date: ${widget.departureDate}'),
              Text('Arrival Date: ${widget.arrivalDate}'),
              Text('Ticket Number: ${widget.ticketNumber}'),
              SizedBox(height: 8.0),
              Text('Departure in: ${_duration.inHours}:${_duration.inMinutes.remainder(60)}:${_duration.inSeconds.remainder(60)}'),
            ],
          ),
        ),
      ),
    );
  }
}
