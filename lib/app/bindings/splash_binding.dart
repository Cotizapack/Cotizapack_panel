import 'package:cotizaweb/app/controllers/MenuController.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.delete<MenuController>();
    Get.put<MenuController>(MenuController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
