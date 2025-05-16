import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0A141E),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0A141E),
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
    cardColor: const Color(0xFF13212F),
  );
}
