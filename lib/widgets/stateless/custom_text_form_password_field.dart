
import 'package:flight_reminder/theme_constants/colours.dart';
import 'package:flight_reminder/theme_constants/text_styles.dart';
import 'package:flutter/material.dart';



class CustomTextFieldPassword extends StatefulWidget {
  final bool isReadonly;
  final TextInputType type;
  final TextEditingController controller;
  final bool underlined;
  final double width;


  const CustomTextFieldPassword({
    Key? key,
    required this.isReadonly,
    required this.type,
    required this.controller,
    this.underlined = false,
    this.width = 300.0,
  }) : super(key: key);

  @override
  State<CustomTextFieldPassword> createState() => _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: widget.width,
        height: 45,
        child: TextFormField(
          readOnly: widget.isReadonly,
          cursorColor:kDarkGray, // Replace with your color
          controller: widget.controller,
          keyboardType: widget.type,
          obscureText: obscureText,
          decoration: widget.underlined ?  underlineBorder() : outlineBorder() ,
        ),
      ),
    );
  }

  InputDecoration outlineBorder() {
    return InputDecoration(
      filled: true,
      fillColor: kWhiteColor, // Replace with your color
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
      hintText: "Password",
       hintStyle: kHintTextField,
      labelStyle: kLabelTextField,
      suffixIcon: IconButton(
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            obscureText = !obscureText; // Toggle password visibility
          });
        },
      ),
    );
  }

  InputDecoration underlineBorder() {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color:kDarkGray),   
      ),  
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: kLightGray),
      ), 
      labelText: "Password",
      hintStyle: kHintTextField,
      labelStyle: kLabelTextField,
      suffixIcon: IconButton(
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            obscureText = !obscureText; // Toggle password visibility
          });
        },
      ),
    );
  }
}
