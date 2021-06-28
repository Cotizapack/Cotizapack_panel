import 'package:cotizaweb/app/data/services/package_services.dart';
import 'package:get/get.dart';
import '../controllers/Package_controller.dart';

class PackagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PackagesController>(
        () => PackagesController(myPackage: PackageRepository()));
  }
}
