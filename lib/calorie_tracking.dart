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
                        "1,500",
                        style: TextStyle(color: Colors.grey[600], fontSize: 40),
                      ),
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
              )
              // Center(
              //   child: Container(
              //     child: ElevatedButton(
              //       onPressed: () => CalculateCalories(gender: gender),
              //       child: Text("data"),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

CalculateCalories({String? gender}) {
  if (gender == "male") {
    return print("1male");
  } else {
    return print("2female");
  }
}
