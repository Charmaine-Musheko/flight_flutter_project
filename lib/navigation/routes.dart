
import 'package:flight_reminder/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:flight_reminder/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:flight_reminder/screens/flights/flight_form.dart';
import 'package:flight_reminder/screens/flights/flight_screen.dart';
import 'package:flight_reminder/screens/onboarding/get_started_screen.dart';
import 'package:flight_reminder/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class Routes {

  static final Map<String, WidgetBuilder> routes = {
    GetStartedScreen.routeName: (context) => const GetStartedScreen(),
    OnBoarding.routeName: (context) => const OnBoarding(),
    SignInScreen.routeName:(context) => const SignInScreen(),
    SignUpScreen.routeName:(context) => const SignUpScreen(),
    FlightScreen.routeName:(context) => const FlightScreen(),
    FlightFormScreen.routeName:(context) => const FlightFormScreen(),

  };
  
}