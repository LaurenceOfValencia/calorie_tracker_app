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

  TextEditingController foodItemController = TextEditingController();
  TextEditingController calorieCountController = TextEditingController();

  List<Widget> _listOfEntries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                          style:
                              TextStyle(color: Colors.blue[800], fontSize: 16),
                        ),
                        Text(
                          "$iBMR calories left",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    color: Colors.blue[200],
                    height: 500,
                    child: ListView.builder(
                        itemCount: _listOfEntries.length,
                        itemBuilder: (context, index) {
                          return _listOfEntries[index];
                        }),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //add the new item here
                    addEntryWidget();
                    //TO DO: Add error catch
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: foodItemController,
                          decoration: const InputDecoration(
                              labelText: 'Food Name',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: calorieCountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Calories',
                              border: OutlineInputBorder()),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addEntryWidget() {
    setState(() {
      //add entry to the list
      iBMR = iBMR! - int.parse(calorieCountController.text);
      _listOfEntries.add(addEntry(
          name: foodItemController.text, calorie: calorieCountController.text));
    });
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

class addEntry extends StatelessWidget {
  final String? name, calorie;

  const addEntry({
    Key? key,
    required this.name,
    required this.calorie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
                  Text("$name"),
                  Text("\ $calorie cal"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
