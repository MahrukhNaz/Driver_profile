import 'package:driver_profile/BottomNav.dart';
import 'package:flutter/material.dart';
import 'package:driver_profile/BottomNav.dart'; // Import your BottomNavBar class
import 'package:driver_profile/earningTab.dart'; // Import your DriverEarningsPage class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavBar(), // Use BottomNavBar as the home page
    );
  }
}
