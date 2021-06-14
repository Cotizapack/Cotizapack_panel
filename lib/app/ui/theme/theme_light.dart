import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appThemelight = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueAccent,
  accentColor: Colors.blue,
  fontFamily: 'Georgia',
  scaffoldBackgroundColor: bgColor,
  textTheme: GoogleFonts.poppinsTextTheme(Get.theme.textTheme).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  canvasColor: secondaryColor,
  backgroundColor: secondaryColor,
);
