import 'package:cotizaweb/app/controllers/MenuController.dart';
import 'package:cotizaweb/app/ui/pages/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/side_menu.dart';

class MainScreen extends GetResponsiveView<MenuController> {
  @override
  Widget? desktop() {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      key: controller.scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            Expanded(
              // default flex = 1
              // and it takes 1/6 part of the screen
              child: SideMenu(),
            ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              // child: Text('hola'),
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget? tablet() {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
