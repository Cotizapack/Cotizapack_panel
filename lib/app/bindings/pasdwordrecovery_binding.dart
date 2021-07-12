
import 'package:get/get.dart';
import '../controllers/pasdwordrecovery_controller.dart';


class PasdwordRecoveryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasdwordRecoveryController>(() => PasdwordRecoveryController());
  }
}