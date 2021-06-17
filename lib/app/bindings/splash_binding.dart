import 'package:cotizaweb/app/controllers/MenuController.dart';
import 'package:cotizaweb/app/controllers/global_Controller.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.delete<MenuController>();
    Get.put<MenuController>(MenuController());
    Get.put<GlobalController>(GlobalController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
