import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/controllers/global_Controller.dart';
import 'package:cotizaweb/app/data/common/get_storage.dart';
import 'package:cotizaweb/app/data/models/session_model.dart';
import 'package:cotizaweb/app/data/models/user_data.dart';
import 'package:cotizaweb/app/data/services/user.dart';
import 'package:cotizaweb/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  UserRepository _userRepository = UserRepository();
  Session _session = Session();
  // AccountRepository _accountRepository = AccountRepository();

  @override
  void onReady() {
    islogin();
    super.onReady();
  }

  void islogin() async {
    try {
      var response = await _userRepository.getSessions();
      await _userRepository.getTeam();
      if (response != null) {
        if (response.statusCode == 200) {
          _session = Session.fromJson(response.data);
          bool checked = (await checkuserData(session: _session))!;
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

  Future<bool?> checkuserData({required Session session}) async {
    try {
      if (MyGetStorage().haveData(key: 'userData')) {
        return true;
      } else {
        UserData value =
            await _userRepository.chargeUserData(userID: session.userId!);
        Get.find<GlobalController>().user = value;

        MyGetStorage().saveData(key: 'userData', data: value.toJson());
        return true;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
