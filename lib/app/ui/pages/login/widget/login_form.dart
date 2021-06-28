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
      child: Column(
        children: <Widget>[
          InputText(
            name: 'Email',
            textInputType: TextInputType.name,
            validator: Validators.emailValidator,
            prefixIcon: Icon(LineIcons.editAlt),
            onChanged: (val) => controller.user.email = val,
          ),
          InputText(
            name: 'Password',
            textInputType: TextInputType.name,
            validator: Validators.passwordValidator,
            prefixIcon: Icon(LineIcons.editAlt),
            onChanged: (val) => controller.user.password = val,
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
