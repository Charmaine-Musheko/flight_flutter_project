
import 'package:flight_reminder/screens/onboarding/onboarding_screen.dart';
import 'package:flight_reminder/theme_constants/text_styles.dart';
import 'package:flight_reminder/widgets/stateless/custom_large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  static String routeName = 'getStartedScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 10,
                child: Column(children: [
                  const Spacer(),
                  const SizedBox(
                    height: 80,
                  ),
//                 SvgPicture.asset(
//   'assets/main_logo.svg', // Use the modified SVG file
//   width: MediaQuery.of(context).size.width * 0.35 > 300
//       ? 300
//       : MediaQuery.of(context).size.width * 0.35,
// ),

                  const SizedBox(
                    width: 300,
                    child: Text(
                      'FLIGHT WATCHER',
                      style: kGetStartedHeader,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      'Getting You There In Time',
                      style: kGetStartedHeaderSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 300,
                    child: Icon(Icons.flight_land,
                    size: 150,)
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ]),
              ),
              CustomLargeButton(
                  text: 'Get Started',
                  onClick: () {
                    Navigator.pushNamed(context, OnBoarding.routeName);
                  },
                  hasShadow: false),
              const SizedBox(
                height: 60,
              )
            ]),
      ),
    );
  }
}
