import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    onSurface: Colors.black,
    primary: Color.fromARGB(255, 34, 50, 64),
    onPrimary: Color.fromARGB(255, 60, 99, 134),
    secondary: Colors.green,
    onSecondary: Colors.white,
    tertiary: Colors.green,
    error: Colors.red,
    outline: Color(0xFF424242),
    inverseSurface: Colors.orange,
  ),
);
