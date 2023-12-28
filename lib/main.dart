import 'package:flutter/material.dart';
import 'package:temp_conv/login.dart';
import 'package:temp_conv/mainpage.dart';
import 'package:temp_conv/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'temp/conv',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/nextPage': (context) => TemperatureConverter(),
      },
    );
  }
}
