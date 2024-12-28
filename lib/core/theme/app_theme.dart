import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        labelMedium: TextStyle(fontSize: 14, color: Colors.grey),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        labelSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey,
          decoration: TextDecoration.lineThrough,),
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.white),
        displayMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }
}

