
import 'package:flight_reminder/theme_constants/colours.dart';
import 'package:flutter/material.dart';

class Flight_Cell extends StatelessWidget {
  final VoidCallback onPressed;

  Flight_Cell({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.library_books, // You can change the icon as needed
                size: 70,
                color: kBlueTextColor, // You can change the color
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "View Articles",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
