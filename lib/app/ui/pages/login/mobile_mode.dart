import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'widget/login_form.dart';

Widget mobileMode(ResponsiveScreen screen) {
  final double widthSize = screen.width;
  final double heightSize = screen.height;

  return Material(
    child: Container(
      color: bgColor,
      child: Center(
        child: Container(
          height: heightSize * 0.65,
          width: widthSize > 700 ? widthSize * 0.5 : widthSize * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                offset: Offset(10, 10),
                blurRadius: 30,
                color: Color(0xFF1c1d2a),
              ),
              BoxShadow(
                offset: Offset(-10, -10),
                color: Color(0xFF26293a),
                blurRadius: 30,
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: bgColor,
            ),
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_white.png',
                  height: heightSize * 0.2,
                  width: widthSize * 0.2,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: LoginForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
