import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/common/alert.dart';
import 'package:cotizaweb/app/data/common/get_storage.dart';
import 'package:cotizaweb/app/data/models/user_model.dart';
import 'package:cotizaweb/app/data/services/user.dart';
import 'package:cotizaweb/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin {
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  UserRepository _userRepository = UserRepository();

  UserModel user = UserModel();
  RxBool viewPass = false.obs;

  void signIn() async {
    try {
      change(null, status: RxStatus.loading());
      _userRepository.signIn(user: user).then((value) async {
        if (value == null) {
          change(null, status: RxStatus.error('usuario no existe'));
          MyAlert.showMyDialog(
              title: 'Error',
              message: 'por favor, intenta de nuevo',
              color: Colors.red);
          return;
        }
        if (value.statusCode! >= 200 && value.statusCode! <= 299) {
          change(null, status: RxStatus.success());
          var a = MyGetStorage().readData(key: 'userData');
          print(a);
          MyAlert.showMyDialog(
              title: '¡Bienvenid@!',
              message: 'estamos cargando tus datos',
              color: Colors.green);
          Timer(Duration(seconds: 2), () => Get.offAllNamed(Routes.INITIAL));
          return;
        }
      }).catchError((e) {
        var error = e as AppwriteException;
        if (error.code == 401) {
          MyAlert.showMyDialog(
              title: 'Credenciales incorrectas',
              message:
                  'por favor, revisa las credenciales ingresadas o crea un nuevo perfíl',
              color: Colors.red);
          // Timer(Duration(seconds: 3), () {
          //   btnController.reset();
          // });
          return;
        }
        print(error.message);
        MyAlert.showMyDialog(
            title: 'Error',
            message: 'por favor, intenta de nuevo',
            color: Colors.red);
      });
    } on AppwriteException catch (e) {
      print('Error ${e.message}');
      change(null, status: RxStatus.error('Error: $e'));
    }
  }
}
