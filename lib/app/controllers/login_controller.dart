import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:cotizaweb/app/data/common/alert.dart';
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
  RxBool viewPass = true.obs;

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
        await _userRepository.getTeam();

        if (value.current) {
          change(null, status: RxStatus.success());
          MyAlert.showMyDialog(
              title: '¡Bienvenid@!',
              message: 'estamos cargando tus datos',
              color: Colors.green);
          Timer(Duration(seconds: 2), () => Get.offAllNamed(Routes.INITIAL));
          return;
        }
      }).catchError((e) {
        var error = e as AppwriteException;
        _userRepository.logout();
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
        if (error.code == 404) {
          MyAlert.showMyDialog(
              title: 'Permiso',
              message: 'No Tiene Permitido iniciar Seisión',
              color: Colors.red);
          return;
        }
        MyAlert.showMyDialog(
            title: 'Error',
            message: 'por favor, intenta de nuevo',
            color: Colors.red);
      });
    } on AppwriteException catch (e) {
      change(null, status: RxStatus.error('Error: ${e.message}'));
    }
  }
}
