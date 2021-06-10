import 'package:cotizaweb/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
      key: _formKey,
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
                controller: _usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese su correo electrónico';
                  }
                },
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
                    color: Colors.white, fontSize: fontSizeTextFormField)),
            SizedBox(height: heightSize * spaceBetweenFields),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Contraseña',
                    style: TextStyle(
                        fontSize: widthSize * fontSizeTextField,
                        fontFamily: 'Poppins',
                        color: Colors.white))),
            TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese su contraseña!';
                  }
                },
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
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.fromLTRB(widthButton, 15, widthButton, 15),
                color: Colors.white,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Get.toNamed(Routes.HOME);
                  }
                },
                child: Text('Iniciar',
                    style: TextStyle(
                        fontSize: widthSize * fontSizeButton,
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(41, 187, 255, 1)))),
            SizedBox(height: heightSize * 0.01),
            Text('olvidé mi contraseña',
                style: TextStyle(
                    fontSize: widthSize * fontSizeForgotPassword,
                    fontFamily: 'Poppins',
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}
