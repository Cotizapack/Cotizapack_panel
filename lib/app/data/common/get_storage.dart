import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:cotizaweb/app/controllers/global_Controller.dart';
import 'package:cotizaweb/app/data/models/categories.dart';
import 'package:cotizaweb/app/data/models/user_data.dart';
import 'package:cotizaweb/app/data/services/user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class MyGetStorage {
  final box = GetStorage();

  Future<void> saveData({required String key, required var data}) async {
    return box.write(key, data);
  }

  Map<String, dynamic>? readData({required String key}) {
    print('reading key: $key');
    return box.read(key) ?? null;
  }

  bool haveData({required String key}) {
    return box.hasData(key);
  }

  Future eraseData() {
    return box.erase();
  }

  Future replaceData({required String key, required var data}) async {
    try {
      await box.remove(key);
      return box.write(key, data);
    } catch (e) {
      print('Error replaceData $e');
    }
  }

  Future<UserData> listenUserData() async {
    Session? _mySession;
    UserData _userData = UserData(
        category: UserCategory(
            id: '', collection: '', enable: false, name: '', description: ''));
    try {
      if (box.hasData('userData')) {
        _userData = UserData.fromJson(box.read("userData"));
        Get.find<GlobalController>().user = _userData;
        return _userData;
      } else {
        _mySession = await UserRepository().getUserSessionData();
        Get.find<GlobalController>().session = _mySession!;
        Get.find<GlobalController>().user = _userData;
        _userData =
            await UserRepository().chargeUserData(userID: _mySession.userId);
        return _userData;
      }
    } on AppwriteException catch (err) {
      print('Error listen User: ${err.message}');
      return _userData;
    }
  }
}
