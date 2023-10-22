import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  
  List<Map<String, String>> onboardingData = [
    {
      "header": "Send Goods",
      "imagePath": "assets/images/onboarding-1.jpeg",
      "message": "Send documents and other parcels below 25kg around Namibia."
    },
        {
      "header": "Package Info",
      "imagePath": "assets/images/onboarding-2.jpeg",
      "message": "Provide specific information on how the package should be handled."
    }, 
        {
      "header": "Secure Pick-up",
      "imagePath": "assets/images/onboarding-3.jpeg",
      "message": "Specify a pick-up date and contact person for secure off-loading."
    }

  ];
}