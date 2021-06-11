import 'package:cotizaweb/app/controllers/login_controller.dart';
import 'package:cotizaweb/app/data/common/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends GetView<LoginController> {
  final paddingTopForm,
      fontSizeTextField,
      fontSizeTextFormField,
      spaceBetweenFields,
      iconFormSize;
  final spaceBetweenFieldAndButton,
      widthButton,
      fontSizeButton,
      fontSizeForgotPassword,
      fontSizeSnackBar,
      errorFormMessage;

  LoginForm(
    this.paddingTopForm,
    this.fontSizeTextField,
    this.fontSizeTextFormField,
    this.spaceBetweenFields,
    this.iconFormSize,
    this.spaceBetweenFieldAndButton,
    this.widthButton,
    this.fontSizeButton,
    this.fontSizeForgotPassword,
    this.fontSizeSnackBar,
    this.errorFormMessage,
  );

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height;

    return Form(
      key: controller.formKey,
      child: Padding(
        padding: EdgeInsets.only(
            left: widthSize * 0.05,
            right: widthSize * 0.05,
            top: heightSize * paddingTopForm),
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Correo electrónico',
                    style: TextStyle(
                        fontSize: widthSize * fontSizeTextField,
                        fontFamily: 'Poppins',
                        color: Colors.white))),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese su correo electrónico';
                }
              },
              onChanged: (value) => controller.user.email = value,
              cursorColor: Colors.white,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                fillColor: Colors.white,
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                labelStyle: TextStyle(color: Colors.white),
                errorStyle: TextStyle(
                    color: Colors.white,
                    fontSize: widthSize * errorFormMessage),
                prefixIcon: Icon(
                  Icons.person,
                  size: widthSize * iconFormSize,
                  color: Colors.white,
                ),
              ),
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSizeTextFormField,
              ),
            ),
            SizedBox(height: heightSize * spaceBetweenFields),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Contraseña',
                    style: TextStyle(
                        fontSize: widthSize * fontSizeTextField,
                        fontFamily: 'Poppins',
                        color: Colors.white))),
            TextFormField(
                validator: Validators.passwordValidator,
                onChanged: (value) => controller.user.password = value,
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  labelStyle: TextStyle(color: Colors.white),
                  errorStyle: TextStyle(
                      color: Colors.white,
                      fontSize: widthSize * errorFormMessage),
                  prefixIcon: Icon(
                    Icons.lock,
                    size: widthSize * iconFormSize,
                    color: Colors.white,
                  ),
                ),
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white, fontSize: fontSizeTextFormField)),
            SizedBox(height: heightSize * spaceBetweenFieldAndButton),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                padding: MaterialStateProperty.all(
                    EdgeInsets.fromLTRB(widthButton, 15, widthButton, 15)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () async {
                if (controller.formKey.currentState!.validate()) {
                  controller.signIn();
                }
              },
              child: Text(
                'Iniciar',
                style: TextStyle(
                  fontSize: widthSize * fontSizeButton,
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(
                    41,
                    187,
                    255,
                    1,
                  ),
                ),
              ),
            ),
            SizedBox(height: heightSize * 0.01),
            Text(
              'olvidé mi contraseña',
              style: TextStyle(
                fontSize: widthSize * fontSizeForgotPassword,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
            // controller.obx(
            //   (data) => Text('data'),
            //   onError: (error) => Text('$error'),
            //   onEmpty: Text('non hay datos'),
            // ),
          ],
        ),
      ),
    );
  }
}
