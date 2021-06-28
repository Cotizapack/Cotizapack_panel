import 'package:cotizaweb/app/data/services/package_services.dart';
import 'package:get/get.dart';
import '../controllers/pakage_controller.dart';

class PakagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PakagesController>(
        () => PakagesController(mypakage: PakageRepository()));
  }
}
