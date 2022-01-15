import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class CalorieTracking extends StatefulWidget {
  final age, height, weight, gender, activity;
  const CalorieTracking(
      {Key? key,
      required this.age,
      required this.height,
      required this.weight,
      required this.gender,
      required this.activity})
      : super(key: key);

  @override
  _CalorieTrackingState createState() => _CalorieTrackingState();
}

class _CalorieTrackingState extends State<CalorieTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(ageController.text),
          Text(heightController.text),
        ],
      )),
    );
  }
}
