// import 'package:flutter/material.dart';


// class OnboardingContent extends StatelessWidget {
//   final String imagePath;
//   final String header;
//   final String message;

//   const OnboardingContent(
//       {required this.imagePath,
//       required this.header,
//       required this.message,
//       Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     {
//       return Stack(children: [
//         Container(
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(imagePath), fit: BoxFit.cover),
//           ),
          
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [kMain, Colors.transparent, Colors.transparent, kMain],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter),
//           ),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Spacer(),
//                 Text(
//                   header,
//                   style: kOnboardingHeader,
//                 ),
//                 const Spacer(
//                   flex: 6,
//                 ),
//                 SizedBox(
//                   width: 300,
//                   child: Text(
//                     message,
//                     style: kOnboardingMessage,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const Spacer(
//                   flex: 2,
//                 ),
//                 const SizedBox(height: 20,)
//               ]),
//         )
//       ]);
//     }
//   }
// }
