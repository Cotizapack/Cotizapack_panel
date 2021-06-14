import 'package:get/get.dart';
import '../controllers/quotations_controller.dart';

class QuotationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuotationsController>(() => QuotationsController());
  }
}
