import 'package:cotizaweb/app/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'desktop_mode.dart';
import 'mobile_mode.dart';

class QuotationsPage extends GetResponsiveView<LoginController> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  @override
  Widget? phone() {
    return mobileMode(screen);
  }

  @override
  Widget desktop() {
    return desktopMode(screen);
  }
}
