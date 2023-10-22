
import 'package:flight_reminder/helpers/function_alias.dart';
import 'package:flight_reminder/theme_constants/text_styles.dart';
import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {

  final String text;
     
  final AnonymousFunction onClick;

  const CustomFlatButton({Key? key, required this.text, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Text(
        text,
        style: kCustomFlatButton
      ),
    );
  }
}