import 'package:cotizaweb/app/controllers/login_controller.dart';
import 'package:cotizaweb/app/data/common/validators.dart';
import 'package:cotizaweb/app/ui/global_widgets/button.dart';
import 'package:cotizaweb/app/ui/global_widgets/textfild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class LoginForm extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InputText(
            name: 'Correo electronico',
            textInputType: TextInputType.emailAddress,
            validator: Validators.emailValidator,
            prefixIcon: Icon(LineIcons.userAlt),
            onChanged: (val) => controller.user.email = val,
          ),
          Obx(
            () => InputText(
              name: 'Contraseña',
              textInputType: TextInputType.visiblePassword,
              validator: Validators.passwordValidator,
              prefixIcon: Icon(LineIcons.lock),
              onChanged: (val) => controller.user.password = val,
              obscureText: controller.viewPass.value,
              maxLines: 1,
              suffixIcon: Material(
                borderRadius: BorderRadius.circular(50),
                child: IconButton(
                  splashRadius: 15,
                  icon: controller.viewPass.value
                      ? Icon(LineIcons.eye)
                      : Icon(LineIcons.eyeSlash),
                  onPressed: controller.viewPass.toggle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ButtonCuston(
              text: 'Ingresar',
              funtion: () {
                if (controller.formKey.currentState!.validate())
                  controller.signIn();
              },
            ),
          )
        ],
      ),
    );
  }
}
