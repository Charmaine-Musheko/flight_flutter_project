import 'dart:typed_data';
import 'dart:ui';
import 'package:flight_reminder/theme_constants/colours.dart';
import 'package:flight_reminder/theme_constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class FlightsDetailsScreen extends StatefulWidget {
   final String imagePath;
  final String title;
  final String subject;
  final String description;
  final int readDuration;
  final String name;
  final String surname;
    final String authorImage;

  static String routeName = 'flightDetailsScreen';

  const FlightsDetailsScreen({Key? key, required this.imagePath, required this.title, required this.subject, required this.description, required this.readDuration, required this.name, required this.surname, required this.authorImage}) : super(key: key);
  @override
  _FlightsDetailsScreenState createState() => _FlightsDetailsScreenState();
}

class _FlightsDetailsScreenState extends State<FlightsDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overhead image (replace 'imagePath' with your image URL)
            Image.network(widget.imagePath),

            // Cell with rounded corners and gray bar
            Container(
              margin: EdgeInsets.only(top: 0),
              decoration: BoxDecoration(
                 image: DecorationImage(
                  image: AssetImage('assets/main_background.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Center(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 5, // Adjust the height as needed
      width: 40, // Adjust the width as needed
      decoration: BoxDecoration(
        color: Colors.grey, // Gray color
        borderRadius: BorderRadius.circular(2.0), // Adjust the radius as needed
      ),// Gray color
    ),
  ),
),
  
                    // Large title and close button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Flexible(
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.title,
          style: kArticleTitle,
          maxLines: 2, // Set the maximum number of lines
          overflow: TextOverflow.ellipsis, // Show ellipsis (...) if text overflows
        ),
      ),
    ),
                        IconButton(
                          onPressed: () {
                            // Handle close button press
                          },
                          icon: Icon(Icons.cancel_rounded),
                        ),
                      ],
                    ),
              
                    // Author and read duration
                    Row(
                      children: [
                        // Small image (author image)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(widget.authorImage),
                          ),
                        ),
                        // Author name and read duration
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${widget.name} ${widget.surname}'),
                           Padding(
                             padding: const EdgeInsets.all(2.0),
                             child: Icon(Icons.circle_rounded, size: 8, color: kGray),
                           ),
                          Text('${widget.readDuration} min read'),
              
                          ],
                        ),
                      ],
                    ),
              
                    // Subject of the article
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        widget.subject,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: kAccent,
                        ),
                      ),
                    ),
              
                    // Divider
                    Divider(),
              
                    // Content of the article (replace 'articleContent' with your content)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(widget.description,
  style: TextStyle(fontSize: 16),
)

                    ),
        //               Padding(
        // padding: const EdgeInsets.all(16.0),
     
                  ],
                ),
            
            ),
          ],
        ),
      ),
    );
  }
}


