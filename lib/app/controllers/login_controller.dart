import 'dart:async';

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
              title: 'A Ocurrido un Error!',
              message: 'Disculpe velva a intentarlo',
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
          Timer(Duration(seconds: 2), () => Get.offAllNamed(Routes.HOME));
          return;
        }
        if (value.statusCode! >= 400 && value.statusCode! <= 499) {
          change(null, status: RxStatus.error('error x'));
          MyAlert.showMyDialog(
              title: 'Error',
              message: 'por favor, intenta de nuevo',
              color: Colors.red);
          // Timer(Duration(seconds: 3), () {
          //   btnController.reset();
          // });
          return;
        }
        if (value.statusCode == 500) {
          MyAlert.showMyDialog(
              title: 'Error',
              message: 'por favor, intenta de nuevo',
              color: Colors.red);
          // Timer(Duration(seconds: 3), () {
          //   btnController.reset();
          // });
          return;
        }
        MyAlert.showMyDialog(
            title: 'Credenciales incorrectas',
            message:
                'por favor, revisa las credenciales ingresadas o crea un nuevo perfíl',
            color: Colors.red);
        print('asaber');
      });
    } catch (e) {
      print('Error $e');
      change(null, status: RxStatus.error('Error: $e'));
    }
    Timer(Duration(seconds: 2), () {});
  }
}
