import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/home_screen.dart';
import 'screen/activity_screen.dart';
import 'screen/food_screen.dart';
import 'screen/sleep_screen.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Manajemen Kesehatan',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple[200],
        hintColor: Colors.purple[100],
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.purple[50],
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.purple[700]),
          bodyLarge: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.purple[300],
          textTheme: ButtonTextTheme.primary,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple[300],
        ),
      ),
      home: HomeScreen(),
    );
  }
}

