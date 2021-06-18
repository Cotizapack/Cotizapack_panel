import 'package:cotizaweb/app/data/services/banner_services.dart';
import 'package:get/get.dart';
import '../controllers/banner_controller.dart';

class BannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BannerController>(
      () => BannerController(mybanners: BannerServices()),
    );
  }
}
