import 'package:cotizaweb/app/data/common/validators.dart';
import 'package:cotizaweb/app/ui/global_widgets/button.dart';
import 'package:cotizaweb/app/ui/global_widgets/textfild.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../../../controllers/pasdwordrecovery_controller.dart';

class PasdwordRecoveryPage
    extends GetResponsiveView<PasdwordRecoveryController> {
  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Container(
        width: screen.width,
        height: screen.height,
        child: SafeArea(
          child: Center(
            child: Container(
              width: screen.width / 3,
              child: Form(
                key: controller.formkey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(
                    children: [
                      Text(
                        'Cambiar contraseña',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      TweenAnimationBuilder(
                        duration: const Duration(seconds: 2),
                        tween: Tween<double>(begin: 0.1, end: 1.0),
                        builder: (_, double value, Widget? child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        },
                        child: Image.asset(
                          'assets/images/logo_colors.png',
                          width: 200,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      InputText(
                        name: 'Contraseña',
                        textInputType: TextInputType.name,
                        validator: Validators.passwordValidator,
                        prefixIcon: Icon(LineIcons.editAlt),
                        onChanged: (val) => controller.password = val,
                        obscureText: true,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputText(
                        name: 'Repetir contraseña',
                        textInputType: TextInputType.name,
                        validator: Validators.passwordValidator,
                        prefixIcon: Icon(LineIcons.editAlt),
                        onChanged: (val) => controller.passwordagain = val,
                        obscureText: true,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ButtonCuston(
                        funtion: controller.changePassword,
                        text: "Aceptar",
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
