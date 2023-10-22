import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'First Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: 'Fibiolla', // Set the initial value from your data
              readOnly: true, // Make it read-only if you don't want to edit
            ),
            SizedBox(height: 20),
            Text(
              'Last Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: 'Plaath', // Set the initial value from your data
              readOnly: true, // Make it read-only if you don't want to edit
            ),
            SizedBox(height: 20),
            Text(
              'Email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: 'chamainemush@gmail.com', // Set the initial value from your data
              readOnly: true, // Make it read-only if you don't want to edit
            ),
            SizedBox(height: 20),
            Text(
              'Password',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: '********', // You can set a placeholder for password
              obscureText: true, // Hide the password
              readOnly: true, // Make it read-only if you don't want to edit
            ),
          ],
        ),
      ),
    );
  }
}
