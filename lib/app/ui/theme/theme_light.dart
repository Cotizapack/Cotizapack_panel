import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appThemelight = ThemeData.light().copyWith(
  primaryColor: Colors.blueAccent,
  iconTheme: IconThemeData(color: Colors.blueAccent),
  scaffoldBackgroundColor: bgColor,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: Colors.blueAccent,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.white,
    background: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(Get.theme.textTheme).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
    decoration: TextDecoration.none,
  ),
  canvasColor: secondaryColor,
  backgroundColor: secondaryColor,
);
