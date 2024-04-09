import 'package:flutter/material.dart';
import 'screens/enrollment_screen.dart'; // Update import path

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Your Score',
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent),
        scaffoldBackgroundColor: Colors.lightGreen.shade50,
        appBarTheme: AppBarTheme(
          elevation: 4.0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
      home: EnrollmentScreen(),
    );
  }
}
