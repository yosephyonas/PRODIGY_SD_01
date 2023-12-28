import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  TextEditingController _temperatureController = TextEditingController();
  String _originalUnit = 'C';
  String _convertedTemperatures = '';

  void convertTemperatures() {
    double temperature = double.tryParse(_temperatureController.text) ?? 0;

    if (_originalUnit == 'C') {
      double fahrenheit = (temperature * 9 / 5) + 32;
      double kelvin = temperature + 273.15;

      setState(() {
        _convertedTemperatures =
            "Converted temperatures:\nFahrenheit: $fahrenheit °F\nKelvin: $kelvin K";
      });
    } else if (_originalUnit == 'F') {
      double celsius = (temperature - 32) * 5 / 9;
      double kelvin = (temperature - 32) * 5 / 9 + 273.15;

      setState(() {
        _convertedTemperatures =
            "Converted temperatures:\nCelsius: $celsius °C\nKelvin: $kelvin K";
      });
    } else if (_originalUnit == 'K') {
      double celsius = temperature - 273.15;
      double fahrenheit = (temperature - 273.15) * 9 / 5 + 32;

      setState(() {
        _convertedTemperatures =
            "Converted temperatures:\nCelsius: $celsius °C\nFahrenheit: $fahrenheit °F";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Temperature Converter',
          style: GoogleFonts.openSans(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _temperatureController,
              keyboardType: TextInputType.number,
              style: GoogleFonts.openSans(),
              decoration: InputDecoration(
                labelText: 'Enter temperature',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _originalUnit,
              items: ['C', 'F', 'K']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.openSans(),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _originalUnit = newValue ?? 'C';
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertTemperatures,
              child: Text(
                'Convert',
                style: GoogleFonts.openSans(),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Text(
                _convertedTemperatures,
                style: GoogleFonts.openSans(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
