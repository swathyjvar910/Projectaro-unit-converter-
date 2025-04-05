import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  SizedBox(height: 15),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter Value",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      inputValue = double.tryParse(value) ?? 0.0;
                    },
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: convert,
                    child: Text("Convert"),
                    style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Result: ${result.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
