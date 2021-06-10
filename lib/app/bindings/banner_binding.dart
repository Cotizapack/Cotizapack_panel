import 'package:cotizaweb/app/data/services/banner_provider.dart';
import 'package:get/get.dart';
import '../controllers/banner_controller.dart';

class BannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BannerController>(
      () => BannerController(
        mybanner: BannerServices(),
      ),
    );
  }
}
