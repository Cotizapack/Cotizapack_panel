import 'package:cotizaweb/app/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
  }
}
