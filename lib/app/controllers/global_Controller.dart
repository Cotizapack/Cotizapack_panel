import 'package:cotizaweb/app/data/common/get_storage.dart';
import 'package:cotizaweb/app/data/models/categories.dart';
import 'package:cotizaweb/app/data/models/user_data.dart';
import 'package:cotizaweb/app/data/services/user.dart';
import 'package:cotizaweb/app/routes/app_pages.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  UserData user = UserData(
      category: UserCategory(
          id: '', collection: '', enable: false, name: '', description: ''));
  UserRepository _userRepository = UserRepository();
  @override
  onInit() async {
    super.onInit();
  }

  logout() {
    _userRepository.logout().then((value) async {
      await MyGetStorage().eraseData();
      Get.offNamed(Routes.INITIAL);
    });
  }
}
