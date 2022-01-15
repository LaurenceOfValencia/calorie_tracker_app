import 'package:flutter/material.dart';
import 'package:my_app/calorie_tracking.dart';
import 'dart:html';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: HomePage(),
      ),
    );
  }
}

TextEditingController ageController = TextEditingController();
TextEditingController heightController = TextEditingController();
TextEditingController weightController = TextEditingController();
var gender = "male";
String activity = 'Light';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var items = ['Light', 'Moderate', 'Active', 'Very Active'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 510,
              color: Colors.grey[200],
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    //age input field
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Age (15-80)',
                      ),
                    ),
                  ),
                  //height input field
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: heightController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Height in cm',
                      ),
                    ),
                  ),
                  //weight input field
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: weightController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Weight in kg',
                      ),
                    ),
                  ),
                  const Divider(
                    height: 5,
                    indent: 20,
                    endIndent: 20,
                  ),
                  //gender radio buttons start
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text("Please select gender"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 10),
                    child: RadioListTile(
                        title: Text("Male"),
                        value: 'male',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = "male";
                          });
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                    child: RadioListTile(
                        title: Text("Female"),
                        value: 'female',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = "female";
                          });
                        }),
                  ),
                  //gender radio buttons end
                  const Divider(
                    height: 5,
                    indent: 20,
                    endIndent: 20,
                  ),
                  //level of activity drop down
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text("Select level of activity"),
                  ),
                  DropdownButton(
                    value: activity,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        activity = "$value";
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () => {
                    if (int.parse(ageController.text) >= 15 &&
                        int.parse(ageController.text) <= 80)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalorieTracking(
                                  age: ageController.text,
                                  height: heightController.text,
                                  weight: weightController.text,
                                  gender: gender,
                                  activity: activity)),
                        )
                      }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(milliseconds: 2000),
                            content: const Text('Please check inputs'),
                          ),
                        ),
                      },
                  },
              child: Text("Calculate"))
        ]),
      ),
    );
  }
}
