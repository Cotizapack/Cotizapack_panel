import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'widget/login_form.dart';

Widget mobileMode(ResponsiveScreen screen) {
  final double widthSize = screen.width;
  final double heightSize = screen.height;

  return Scaffold(
    body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(66, 105, 255, 1),
              Color.fromRGBO(66, 205, 255, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            Image.asset('images/login-form.png',
                height: heightSize * 0.3, width: widthSize * 0.6),
            SingleChildScrollView(
              child: LoginForm(
                0.007,
                0.04,
                widthSize * 0.04,
                0.06,
                0.04,
                0.07,
                widthSize * 0.09,
                0.05,
                0.032,
                0.04,
                0.032,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
