import 'package:cotizaweb/app/controllers/global_Controller.dart';
import 'package:cotizaweb/app/data/common/alert.dart';
import 'package:cotizaweb/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});
  var prefr = Get.find<GlobalController>();

  @override
  RouteSettings? redirect(String? route) {
    if (prefr.user.id != null) return null;
    // Get.offAllNamed(Routes.INITIAL);
    Future.delayed(
        Duration(seconds: 1),
        () => MyAlert.showMyDialog(
              title: 'Error',
              message:
                  'inicie sesion para poder acceder as las demas pantallas.',
              color: Colors.red.withOpacity(0.8),
            ));
    return RouteSettings(name: Routes.INITIAL);
  }
}
