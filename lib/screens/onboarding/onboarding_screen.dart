
import 'package:flight_reminder/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:flight_reminder/screens/flights/flight_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  static String routeName = "onboardingScreen";

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController();
  PageController textController = PageController();
  PageController descriptionController = PageController();

  int selectedIndex = 0;
  List<Color> colorList = [
    Color.fromARGB(255, 255, 255, 255),
     Color.fromARGB(255, 233, 181, 255),
     Color.fromARGB(255, 178, 178, 178),
  ];

  List<Color> nextColorList = [
      Color.fromARGB(255, 233, 181, 255),
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 179, 179, 179),
  ];

  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.transparent,
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              height: size.height,
              width: 76,
              child: ClipPath(
                child: Container(
                 color: Color.fromARGB(255, 255, 255, 255),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: size.height * 0.195, right: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex == 2
                                ? (Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                SignInScreen())))
                                : selectedIndex++;

                            pageController.animateToPage(
                              selectedIndex,
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                            textController.animateToPage(
                              selectedIndex,
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                            descriptionController.animateToPage(
                              selectedIndex,
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                          });
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            border: Border.all(
                                color: selectedIndex == 2
                                    ? Colors.white
                                    : Colors.black,
                                width: 0.7),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: selectedIndex == 2
                                ? Colors.white
                                : Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
               // clipper: ClipPathClass(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
        //             Center(
        //   child: Image.asset(
        //     'assets/smaller_logo.png', // Path to your image asset
        //     width: MediaQuery.of(context).size.width * 0.5, 
        //     height: MediaQuery.of(context).size.height * 0.2, 
        //   ),
        // ),
                    Padding(
                      padding: EdgeInsets.only(right: 18.0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FlightScreen()));
                          },
                          child: Text('skip')),
                    ),
                  ],
                ),
                
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.height * 0.4,
                  child: PageView(
                    controller: pageController,
                    children: [
            Icon(
        Icons.flight_takeoff, // Use the flight_takeoff icon
        size: 150, // Set the size of the icon
        color: Colors.brown, // Set the color of the icon
      ),
      Icon(
        Icons.flight_land, // Use the flight_land icon
        size: 150, // Set the size of the icon
        color: Colors.brown, // Set the color of the icon
      ),
      Icon(
        Icons.airplanemode_active, // Use the airplanemode_active icon
        size: 150, // Set the size of the icon
        color: Colors.brown, // Set the color of the icon
      ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 41,
                // ),
                SizedBox(
                  width: size.width * 0.7,
                  height: 27,
                  child: PageView(
                    controller: textController,
                    children: const [
                      Text(
                        'Reminder \nEasy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Time \nEasy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Flights \nEasy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: size.width * 0.7,
                  height: 50,
                  child: PageView(
                    controller: descriptionController,
                    children: const [
                      Text(
                        'Catch your flight on time',
                      ),
                      Text(
                        'Catch each flight',
                      ),
                      Text(
                        'On time All the time',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 20,
                  width: 100,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Container(
                        height: 13,
                        width: 13,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.grey
                              : Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = 1;
    final double _yScaling = size.height * 0.0014;
    path.lineTo(60.9997 * _xScaling, -1.5 * _yScaling);
    path.cubicTo(
      60.9997 * _xScaling,
      -1.5 * _yScaling,
      75.9997 * _xScaling,
      -1.5 * _yScaling,
      75.9997 * _xScaling,
      -1.5 * _yScaling,
    );
    path.cubicTo(
      75.9997 * _xScaling,
      -1.5 * _yScaling,
      75.9997 * _xScaling,
      811.5 * _yScaling,
      75.9997 * _xScaling,
      811.5 * _yScaling,
    );
    path.cubicTo(
      75.9997 * _xScaling,
      811.5 * _yScaling,
      60.9997 * _xScaling,
      811.5 * _yScaling,
      60.9997 * _xScaling,
      811.5 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      811.5 * _yScaling,
      60.9997 * _xScaling,
      663.25 * _yScaling,
      60.9997 * _xScaling,
      663.25 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      663.25 * _yScaling,
      60.9997 * _xScaling,
      676.901 * _yScaling,
      60.9997 * _xScaling,
      654.763 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      610.638 * _yScaling,
      0.5 * _xScaling,
      595 * _yScaling,
      0.5 * _xScaling,
      556 * _yScaling,
    );
    path.cubicTo(
      0.5 * _xScaling,
      517 * _yScaling,
      60.9997 * _xScaling,
      501.5 * _yScaling,
      60.9997 * _xScaling,
      462.638 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      440.5 * _yScaling,
      60.9997 * _xScaling,
      452 * _yScaling,
      60.9997 * _xScaling,
      452 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      452 * _yScaling,
      60.9997 * _xScaling,
      -1.5 * _yScaling,
      60.9997 * _xScaling,
      -1.5 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      -1.5 * _yScaling,
      60.9997 * _xScaling,
      -1.5 * _yScaling,
      60.9997 * _xScaling,
      -1.5 * _yScaling,
    );
    // path.lineTo(31 * _xScaling, 551 * _yScaling);
    // path.cubicTo(
    //   31 * _xScaling,
    //   551 * _yScaling,
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    // );
    // path.cubicTo(
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    //   31 * _xScaling,
    //   560 * _yScaling,
    //   31 * _xScaling,
    //   560 * _yScaling,
    // );
    // path.lineTo(31 * _xScaling, 551 * _yScaling);
    // path.cubicTo(
    //   31 * _xScaling,
    //   551 * _yScaling,
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    // );
    // path.cubicTo(
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    //   31 * _xScaling,
    //   560 * _yScaling,
    //   31 * _xScaling,
    //   560 * _yScaling,
    // );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
