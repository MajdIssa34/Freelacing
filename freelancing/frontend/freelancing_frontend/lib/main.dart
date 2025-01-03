import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(FreelancerSearchApp());
}

class FreelancerSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freelancer Search',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}