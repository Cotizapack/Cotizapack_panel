import 'package:cotizaweb/app/ui/pages/banner_page/desktop_screen.dart';
import 'package:cotizaweb/app/ui/pages/banner_page/phone_screen.dart';
import 'package:cotizaweb/app/ui/pages/banner_page/tablet_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/banner_controller.dart';

class BannerPage extends GetResponsiveView<BannerController> {
  @override
  Widget phone() {
    return Phonescreen(
      screen: screen,
    );
  }

  @override
  Widget tablet() {
    return TabletPage(
      screen: screen,
    );
  }

  @override
  Widget desktop() {
    controller.onInit();
    return Desktoscreen(
      screen: screen,
    );
  }
}
