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
  int? iBMR = CalculateCalories(
      gender: gender,
      age: double.parse(ageController.text),
      height: double.parse(heightController.text),
      weight: double.parse(weightController.text),
      bmrMultiplier: calculateBMR(activity: activity));

  int caloriesNeeded = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.grey[300],
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Calories/day",
                        style: TextStyle(color: Colors.blue[800], fontSize: 16),
                      ),
                      Text(
                        "$iBMR calories left",
                        style: TextStyle(color: Colors.grey[800], fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            height: 50,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("entry name"),
                                Text("\ 100 cal"),
                              ],
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    color: Colors.blue[500], shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    "+",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              // Center(
              //   child: Container(
              //     child: ElevatedButton(
              //       onPressed: () => print("$iBMR"),
              //       //CalculateCalories(
              //       //     gender: gender,
              //       //     age: double.parse(ageController.text),
              //       //     height: double.parse(heightController.text),
              //       //     weight: double.parse(weightController.text),
              //       //     activity: activity),
              //       child: Text("data"),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

int? CalculateCalories(
    {String? gender,
    double? age,
    double? height,
    double? weight,
    double? bmrMultiplier}) {
  print("$bmrMultiplier");
  if (gender == "male") {
    return ((655.1 +
                (9.563 * double.parse(weightController.text)) +
                (1.850 * double.parse(heightController.text)) -
                (4.676 * double.parse(ageController.text))) *
            bmrMultiplier!)
        .round();
  } else {}
}

double? calculateBMR({String? activity}) {
  switch (activity) {
    case "Sedentary":
      return 1.2;
    case "Lightly active":
      return 1.375;

    case "Moderately active":
      return 1.55;

    case "Active":
      return 1.725;

    case "Very Active":
      return 1.9;
  }
}
