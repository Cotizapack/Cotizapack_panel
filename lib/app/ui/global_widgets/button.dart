import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonCuston extends GetView {
  final bool isMovil;
  final String? text;
  final void Function()? funtion;
  final Widget? icon;
  final Color? bgcolor;

  ButtonCuston(
      {this.isMovil = false, this.text, this.funtion, this.icon, this.bgcolor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      child: ElevatedButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: this.bgcolor ?? primaryColor,
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding * 1.5,
            vertical: defaultPadding / (isMovil ? 2 : 1),
          ),
        ),
        onPressed: funtion,
        icon: icon ?? Container(),
        label: Text("$text"),
      ),
    );
  }
}
