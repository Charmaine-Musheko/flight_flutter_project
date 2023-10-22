import 'package:flight_reminder/locator.dart';
import 'package:flight_reminder/repositories/flight_repository/flight_result.dart';
import 'package:flight_reminder/screens/flights/flight_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FlightFormScreen extends StatefulWidget {
   static String routeName = 'flightFormScreen';
   const FlightFormScreen({Key? key}): super(key: key);
  @override
  _FlightFormScreenState createState() => _FlightFormScreenState();
}

class _FlightFormScreenState extends State<FlightFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _airportNameController = TextEditingController();
  final _departureLocationController = TextEditingController();
  final _destinationController = TextEditingController();
  final _departureTimeController = TextEditingController();
  final _arrivalTimeController = TextEditingController();
  final _flightDateController = TextEditingController();
  final _departureDateController = TextEditingController();
  final _arrivalDateController = TextEditingController();
  final _ticketNumberController = TextEditingController();
  final FlightViewModel viewModel = locator<FlightViewModel>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<FlightViewModel>(
        builder: (context, value, child) => Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.brown, // Set the background color to brown
  title: Text(
    'Flight Form',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400 // Set the text color to white
    ),
  ),
),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _airportNameController,
                  decoration: InputDecoration(labelText: 'Airport Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an airport name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _departureLocationController,
                  decoration: InputDecoration(labelText: 'Departure Location'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a departure location';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _destinationController,
                  decoration: InputDecoration(labelText: 'Destination'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a destination';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _departureTimeController,
                  decoration: InputDecoration(labelText: 'Departure Time'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a departure time';
                    }
                    return null;
                  },
                  onTap: () async {
                    final time = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (time != null) {
                      _departureTimeController.text =
                          time.format(context).toString();
                    }
                  },
                ),
                TextFormField(
                  controller: _arrivalTimeController,
                  decoration: InputDecoration(labelText: 'Arrival Time'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an arrival time';
                    }
                    return null;
                  },
                  onTap: () async {
                    final time = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (time != null) {
                      _arrivalTimeController.text =
                          time.format(context).toString();
                    }
                  },
                ),
                TextFormField(
                  controller: _flightDateController,
                  decoration: InputDecoration(labelText: 'Flight Date'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a flight date';
                    }
                    return null;
                  },
                  onTap: () async {
                    final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      _flightDateController.text =
                          DateFormat('yyyy-MM-dd').format(date);
                    }
                  },
                ),
                TextFormField(
                  controller: _departureDateController,
                  decoration: InputDecoration(labelText: 'Departure Date'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a departure date';
                    }
                    return null;
                  },
                  onTap: () async {
                    final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      _departureDateController.text =
                          DateFormat('yyyy-MM-dd').format(date);
                    }
                  },
                ),
                TextFormField(
                  controller: _arrivalDateController,
                  decoration: InputDecoration(labelText: 'Arrival Date'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an arrival date';
                    }
                    return null;
                  },
                  onTap: () async {
                    final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      _arrivalDateController.text =
                          DateFormat('yyyy-MM-dd').format(date);
                    }
                  },
                ),
                TextFormField(
                  controller: _ticketNumberController,
                  decoration: InputDecoration(labelText: 'Ticket Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a ticket number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Container(
                    width: double.infinity,
                   
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
      primary: Colors.brown, // You can use Colors.beige if it's defined in your theme
    ),
                    child: Text('Save'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        viewModel.saveFlight(
                          _airportNameController.text,
                          _departureLocationController.text,
                          _destinationController.text,
                          _departureTimeController.text,
                          _arrivalTimeController.text,
                          _flightDateController.text,
                          _departureDateController.text,
                          _arrivalDateController.text,
                          _ticketNumberController.text,
                        ).then((result) {
                          if (result.status == FlightStatus.success) {
                            // Navigate to a success screen or go back to the previous screen.
                            Navigator.of(context).pop();
                          } else {
                            // Display an error message.
                            final snackBar = SnackBar(
                              content: Text('Error: Unable to save flight details'),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        });
                      }
                    },
                  ),
                  ),


                  
                ),
              ],
            ),
          ),
        ),
      ),
        )
      )
    );
  }
}