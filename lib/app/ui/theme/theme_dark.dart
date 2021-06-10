import 'package:flutter/material.dart';

final ThemeData appThemedark = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: Colors.blueAccent,
  accentColor: Colors.blue,
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
