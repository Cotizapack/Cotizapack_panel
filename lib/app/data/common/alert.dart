import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAlert {
  static showMyDialog(
      {required String title, required String message, required Color color}) {
    return Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      titleText: new Text(
        title,
      ),
      messageText: new Text(
        message,
      ),
      backgroundColor: color,
    );
  }
}
