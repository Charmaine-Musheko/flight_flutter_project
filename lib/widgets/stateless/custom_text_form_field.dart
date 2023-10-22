   

import 'package:flight_reminder/theme_constants/colours.dart';
import 'package:flight_reminder/theme_constants/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool isReadonly;
  final String hint;
  final TextInputType type;
  final bool obscureText;
  final TextEditingController controller;
  final bool underlined;
  final double width;

  const CustomTextField({Key? key, required this.isReadonly, required this.hint, required this.type, required this.obscureText, required this.controller, this.underlined  = false, this.width = 300.0}) : super(key: key);
   
   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: width,
        height: 45,
        child:TextFormField(
                  readOnly: isReadonly,
          cursorColor: kDarkGray,
          controller: controller,
          keyboardType: type,
          obscureText: obscureText,
          decoration: underlined ? underlineBorder() : outlineBorder()
                ),
      ),
    );
  }

  InputDecoration outlineBorder() {
    return InputDecoration(
            filled: true,
            fillColor: kWhiteColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kLightGray, width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(2.0),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kLightGray, width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(2.0),
              ),
            ),
            hintText: hint,
            hintStyle: kHintTextField,
            labelStyle: kLabelTextField
    );
  }

     InputDecoration underlineBorder() {
    return InputDecoration(
            enabledBorder: const UnderlineInputBorder(      
                      borderSide: BorderSide(color: kLightGray),   
                      ),  
              focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kDarkGray),
                   ), 
            labelText: hint,
            hintStyle: kHintTextField,
            labelStyle: kLabelTextField);
  }
  }