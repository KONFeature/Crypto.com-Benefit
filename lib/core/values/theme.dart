import 'package:flutter/material.dart';
import 'colors.dart' as colors;

// Light theme of our app
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: colors.primarySwatch,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

// Dark theme of our app
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.green[700],
  accentColor: Colors.green[500],
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
