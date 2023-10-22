
import 'package:flutter/material.dart';

class FlightDetailScreen extends StatefulWidget {
  final String airportName;
  final String departureLocation;
  final String destination;
  final String departureTime;
  final String arrivalTime;
  final String flightDate;
  final String departureDate;
  final String arrivalDate;
  final String ticketNumber;
  final Function() onDelete; // Callback for delete action

  FlightDetailScreen({
    required this.airportName,
    required this.departureLocation,
    required this.destination,
    required this.departureTime,
    required this.arrivalTime,
    required this.flightDate,
    required this.departureDate,
    required this.arrivalDate,
    required this.ticketNumber,
    required this.onDelete,
  });


  @override
  _FlightDetailScreenState createState() => _FlightDetailScreenState();
}

class _FlightDetailScreenState extends State<FlightDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
  backgroundColor: Colors.brown, // Set the background color to brown
  title: Text(
    'Flight Details',
    style: TextStyle(
      color: Colors.white,
       fontWeight: FontWeight.w400  // Set the text color to white
    ),
  ),
),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildDetailRow("Airport Name", widget.airportName),
                _buildDetailRow("Departure Location", widget.departureLocation),
                _buildDetailRow("Destination", widget.destination),
                _buildDetailRow("Departure Time", widget.departureTime),
                _buildDetailRow("Arrival Time", widget.arrivalTime),
                _buildDetailRow("Flight Date", widget.flightDate),
                _buildDetailRow("Departure Date", widget.departureDate),
                _buildDetailRow("Arrival Date", widget.arrivalDate),
                _buildDetailRow("Ticket Number", widget.ticketNumber),
                SizedBox(height: 16.0),
                Container(
  width: double.infinity, // Makes the button as wide as the parent widget
  child: ElevatedButton(
    onPressed: widget.onDelete,
    style: ElevatedButton.styleFrom(
      primary: Colors.brown, // You can use Colors.beige if it's defined in your theme
    ),
    child: Text(
      'Delete Flight',
      style: TextStyle(
        color: Colors.white, // Text color
        fontSize: 16, // Text size
      ),
    ),
  ),
)

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Container(
       width: double.infinity, 
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
