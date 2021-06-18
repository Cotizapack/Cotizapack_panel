import 'package:cotizaweb/app/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.delete<LoginController>();
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }
}
