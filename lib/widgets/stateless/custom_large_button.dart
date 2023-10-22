
import 'package:flight_reminder/helpers/function_alias.dart';
import 'package:flight_reminder/theme_constants/colours.dart';
import 'package:flight_reminder/theme_constants/text_styles.dart';
import 'package:flutter/material.dart';

class CustomLargeButton extends StatelessWidget {
  final String text;

  final AnonymousFunction onClick;

  final bool hasShadow;

  const CustomLargeButton(
      {required this.text,
      required this.onClick,
      required this.hasShadow,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: SizedBox(
      height: 45,
      width: 300,
      child: Material(
        elevation: hasShadow ? 8.0 : 0.0,
        shadowColor: Colors.brown,
        borderRadius: BorderRadius.circular(2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.brown, // Border color
                width: 1.0, // Border width
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: ElevatedButton(
              onPressed: onClick,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(kWhiteColor),
              ),
              child: Text(text, style: kLargeCustomButton),
            ),
          ),
        ),
      ),
    ),
  );
}

}
