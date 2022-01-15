import 'package:flutter/material.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final VoidCallback onPressed;
  var _selectedGender = "male";
  String dropdownvalue = 'Light';
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
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Age (15-80)',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Height in cm',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    child: TextFormField(
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text("Please select gender"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 10),
                    child: RadioListTile(
                        title: Text("Male"),
                        value: 'male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = "male";
                          });
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                    child: RadioListTile(
                        title: Text("Female"),
                        value: 'female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = "female";
                          });
                        }),
                  ),
                  const Divider(
                    height: 5,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text("Select level of activity"),
                  ),
                  DropdownButton(
                    value: dropdownvalue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownvalue = "$value";
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(onPressed: {
            if (ageController >= 15) {_generateCalories} else {print("object")}
          }, child: Text("Calculate"))
        ]),
      ),
    );
  }
}
