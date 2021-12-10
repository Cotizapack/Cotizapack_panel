import 'package:get/get.dart';
import '../controllers/passwordrecovery_controller.dart';

class PasswordRecoveryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasdwordRecoveryController>(() => PasdwordRecoveryController());
  }
}
