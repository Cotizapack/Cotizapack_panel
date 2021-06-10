import 'package:cotizaweb/app/controllers/MenuController.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MenuController>(MenuController());
  }
}
