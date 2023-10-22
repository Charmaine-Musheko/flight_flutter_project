import 'dart:async';

import 'package:flight_reminder/locator.dart';
import 'package:flight_reminder/screens/flights/flight_detail_screen.dart';
import 'package:flight_reminder/screens/flights/flight_view_model.dart';
import 'package:flutter/material.dart';

class FlightCell extends StatefulWidget {
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

  const FlightCell({
    Key? key,
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
  }) : super(key: key);

  @override
  _FlightCellState createState() => _FlightCellState();
}

class _FlightCellState extends State<FlightCell> {
  late Timer _timer;
  late Duration _duration;
    final FlightViewModel viewModel = locator<FlightViewModel>();

   @override
  void initState() {
    super.initState();
    
    final now = DateTime.now();
    final departureTime = DateTime(now.year, now.month, now.day, // Use today's date
        int.parse(widget.departureTime.split(':')[0]), int.parse(widget.departureTime.split(':')[1]));

    _duration = departureTime.difference(now);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
          if (_duration.inSeconds > 0) {
        _duration = _duration - Duration(seconds: 1);
          }
      });
      if (_duration.inMinutes == 15) {
          // Show a dialog
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Time Alert'),
                content: Text('Your flight is departing soon!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Got it!'),
                  ),
                ],
              );
            },
          );
        }
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FlightDetailScreen(
                airportName: widget.airportName,
                departureLocation: widget.departureLocation,
                destination: widget.destination,
                departureTime: widget.departureTime,
                arrivalTime: widget.arrivalTime,
                flightDate: widget.flightDate,
                departureDate: widget.departureDate,
                arrivalDate: widget.arrivalDate,
                ticketNumber: widget.ticketNumber, onDelete: () { viewModel.deleteFlight(widget.flightId);  },
              ),
            ),
          );
        },
        child: ListTile(
          leading: Icon(Icons.flight),
          title: Text('Flight Details'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Airport Name: ${widget.airportName}'),
              Text('Departure Location: ${widget.departureLocation}'),
               Text('Arrival Time: ${widget.arrivalTime}'),
                Text('Ticket Number: ${widget.ticketNumber}'),
              Text('Departure in: ${_duration.inHours}:${_duration.inMinutes.remainder(60)}:${_duration.inSeconds.remainder(60)}'),
            ],
          ),
        ),
       
      ),
    );
  }
}
