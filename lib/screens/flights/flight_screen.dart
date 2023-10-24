import 'package:flight_reminder/database/model/entities/user.dart';
import 'package:flight_reminder/database/repositories/state/state_repository.dart';
import 'package:flight_reminder/locator.dart';
import 'package:flight_reminder/screens/flights/flight_form.dart';
import 'package:flight_reminder/screens/flights/flight_view_model.dart';
import 'package:flight_reminder/services/dtos/flight_dto.dart';
import 'package:flight_reminder/theme_constants/colours.dart';
import 'package:flight_reminder/theme_constants/text_styles.dart';
import 'package:flight_reminder/widgets/stateful/loading_view.dart';
import 'package:flight_reminder/widgets/stateless/flight_cell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class FlightScreen extends StatefulWidget {
  static String routeName = 'flightScreen';
  const FlightScreen({Key? key}) : super(key: key);

  @override
  _FlightScreenState createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> with WidgetsBindingObserver {
  final FlightViewModel viewModel = locator<FlightViewModel>();
  final ScrollController _scrollController = ScrollController();
  late Future<User?> _user;
  late Future<List<FlightDto?>> _requests;
  final StateRepository _stateRepository = locator<StateRepository>();
  final int maxSentences = 1; // Adjust this to the desired number of sentences
  Set<int> likedArticles = Set<int>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (!viewModel.isFutureLoading) {
      // _user = viewModel.getUser();
      _requests = viewModel.get();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (!viewModel.isFutureLoading && !_stateRepository.isLoggingOut) {
        _requests = viewModel.get();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<FlightViewModel>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown,
            title: Text(
              'Flights',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 2.0,
              ),
            ),
            actions: [
              // Add an IconButton in the AppBar
              IconButton(
                icon: Icon(Icons.add), // Add icon
                onPressed: () {
                  // Navigate to the FlightFormScreen when the icon is pressed
                  Navigator.pushNamed(context, FlightFormScreen.routeName);
                },
              ),
            ],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height, // Provide a fixed height
                  child: Column(
                    children: [
                      Container(
                        child: FutureBuilder(
                          future: _requests,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              if (snapshot.hasData) {
                                List<FlightDto?> requests = snapshot.data as List<FlightDto?>;
                                if (requests.isNotEmpty) {
                                  return ListView.builder(
                                    controller: _scrollController,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: requests.length, // Replace with your actual number of articles
                                    itemBuilder: (context, index) {
                                      final FlightDto? request = requests[index];
                                      // Replace with your article data
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FlightCell(
                                          airportName: request!.airportName,
                                          departureLocation: request.departureLocation,
                                          destination: request.destination,
                                          departureTime: request.departureTime,
                                          arrivalTime: request.arrivalTime,
                                          flightDate: request.flightDate,
                                          departureDate: request.departureDate,
                                          arrivalDate: request.arrivalDate,
                                          ticketNumber: request.ticketNumber,
                                          flightId: request.flightId,
                                          
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      color: kAddressCardColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(32.0),
                                        child: Text(
                                          _emptyMessage(),
                                          style: kArticleSubject,
                                        ),
                                      ),
                                    ),
                                    );
                                }
                              } else {
                                return const SizedBox();
                              }
                            } else {
                              return const LoadingView(show: true, isWhiteBg: true);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _emptyMessage() {
    return 'No Flights Right Now';
  }
}
