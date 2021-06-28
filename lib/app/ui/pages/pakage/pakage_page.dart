import 'package:cotizaweb/app/controllers/pakage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'desktop_mode.dart';
import 'mobile_mode.dart';

class PakagesPage extends GetResponsiveView<PakagesController> {
  PakagesPage()
      : super(settings: ResponsiveScreenSettings(tabletChangePoint: 1024));
  @override
  Widget? phone() {
    return Movilcreen(screen: screen);
  }

  @override
  Widget desktop() {
    return Desktoscreen(screen: screen);
  }
}
