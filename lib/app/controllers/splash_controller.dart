import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:cotizaweb/app/controllers/global_Controller.dart';
import 'package:cotizaweb/app/data/common/get_storage.dart';
import 'package:cotizaweb/app/data/models/user_data.dart';
import 'package:cotizaweb/app/data/services/user.dart';
import 'package:cotizaweb/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  UserRepository _userRepository = UserRepository();
  // AccountRepository _accountRepository = AccountRepository();

  @override
  void onReady() {
    islogin();
    super.onReady();
  }

  void islogin() async {
    try {
      var user = await _userRepository.getSessions();
      await _userRepository.getTeam();
      if (user != null) {
        if (user.$id != '') {
          bool checked = (await checkuserData(user: user));
          Timer(
            Duration(seconds: 1),
            () => Get.offNamed(
              checked ? Routes.HOME : Routes.LOGIN,
            ),
          );
        }
      }
    } on AppwriteException catch (e) {
      print('Error splash: $e');
      Timer(Duration(seconds: 2), () => Get.offNamed(Routes.LOGIN));
    }
  }

  Future<bool> checkuserData({required User user}) async {
    try {
      if (MyGetStorage().haveData(key: 'userData')) {
        return Future.value(true);
      } else {
        UserData value = await _userRepository.chargeUserData(userID: user.$id);
        Get.find<GlobalController>().user = value;

        MyGetStorage().saveData(key: 'userData', data: value.toJson());
        return Future.value(true);
      }
    } catch (e) {
      print('Error: $e');
      return Future.value(false);
    }
  }
}
