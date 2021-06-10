import 'package:cotizaweb/app/data/services/banner_provider.dart';
import 'package:get/get.dart';

class BannerController extends GetxController with StateMixin {
  final BannerServices mybanner;

  BannerController({required this.mybanner});
  @override
  void onInit() {
    mybanner.getallMyBanner().then((value) {
      print(value);
    });

    super.onInit();
  }
}
