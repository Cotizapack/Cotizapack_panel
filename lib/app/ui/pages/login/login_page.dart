import 'package:cotizaweb/app/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'desktopMode.dart';
import 'mobile_mode.dart';

class LoginPage extends GetResponsiveView<LoginController> {
  @override
  Widget? phone() {
    return mobileMode(screen);
  }

  @override
  Widget desktop() {
    return desktopMode(screen);
  }
}
