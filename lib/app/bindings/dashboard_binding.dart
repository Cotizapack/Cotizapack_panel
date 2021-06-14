import 'package:cotizaweb/app/controllers/MenuController.dart';
import 'package:cotizaweb/app/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.delete<MenuController>();
    Get.lazyPut<MenuController>(() => MenuController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
