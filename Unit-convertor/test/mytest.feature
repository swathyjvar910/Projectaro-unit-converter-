//#Important! Cliimport 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  String? selectedUnit;
  double inputValue = 0.0;
  double result = 0.0;

  final List<String> unitTypes = [
    "Meters to Feet",
    "Kilograms to Pounds",
    "Celsius to Fahrenheit"
  ];

  void convert() {
    setState(() {
      if (selectedUnit == "Meters to Feet") {
        result = inputValue * 3.28084;
      } else if (selectedUnit == "Kilograms to Pounds") {
        result = inputValue * 2.20462;
      } else if (selectedUnit == "Celsius to Fahrenheit") {
        result = (inputValue * 9 / 5) + 32;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unit Converter")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedUnit,
              hint: Text("Select Conversion"),
              isExpanded: true,
              items: unitTypes.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedUnit = newValue;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter Value"),
              onChanged: (value) {
                inputValue = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convert,
              child: Text("Convert"),
            ),
            SizedBox(height: 20),
            Text(
              "Result: $result",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
ck the "generate tests" button if you have made any changes to this file.

//#Read more about Gherkin syntax https://cucumber.io/docs/gherkin/reference/
//#Read more about bdd_widget_test package https://pub.dev/packages/bdd_widget_test 

//#Example of BDD(Gherkin) syntax:
//#
//#Feature: Counter
//#  Scenario: Initial counter value is 0
//#    Given the app is running
//#    Then I see {'0'} text