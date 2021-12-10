import 'package:cotizaweb/app/data/common/alert.dart';
import 'package:cotizaweb/app/data/models/token_reset_password.dart';
import 'package:cotizaweb/app/data/services/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasdwordRecoveryController extends GetxController {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  UserRepository _repository = UserRepository();
  TokenReset user = TokenReset();
  String password = '';
  String passwordagain = '';
  @override
  void onReady() {
    user.userId = Get.parameters["userId"];
    user.secret = Get.parameters["secret"];
    if (user.userId == null)
      MyAlert.showMyDialog(
        title: 'No hay datos',
        message: 'No se proporciono el usuario.',
        color: Colors.red.withOpacity(0.8),
      );
    print(user.userId);
    print(user.secret);
    super.onReady();
  }

  changePassword() async {
    if (password != passwordagain)
      return MyAlert.showMyDialog(
        title: 'Error',
        message: 'Las Contraseñas no son iguales',
        color: Colors.red.withOpacity(0.8),
      );
    if (formkey.currentState!.validate()) {
      var status = await _repository.changePassword(
        userID: user.userId!,
        secret: user.secret!,
        password: password,
        passwordagain: passwordagain,
      );
      if (!status)
        return MyAlert.showMyDialog(
          title: 'Error',
          message:
              'Ocurrio un error al cambiar la contraseña reenvie el correo porfavor.',
          color: Colors.red.withOpacity(0.8),
        );
      MyAlert.showMyDialog(
        title: 'Exito',
        message: 'Cambio de contraeña exito',
        color: Colors.green.withOpacity(0.8),
      );
    }
  }
}
