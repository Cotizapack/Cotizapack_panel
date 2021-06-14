import 'package:cotizaweb/app/ui/pages/login/widget/login_form.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

Widget desktopMode(ResponsiveScreen screen) {
  final double widthSize = screen.width;
  final double heightSize = screen.height;
  return Scaffold(
    backgroundColor: Get.theme.backgroundColor,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    body: Padding(
      padding: const EdgeInsets.all(defaultPadding * 2),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white30,
                    blurRadius: 8.0,
                    offset: Offset(-2.0, 2.0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                        //validator: Validators.passwordValidator,
                        // onChanged: (value) => controller.user.password = value,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Título',
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          labelStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(
                            color: Colors.white,
                            //fontSize: widthSize * errorFormMessage
                          ),
                        ),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          //fontSize: fontSizeTextFormField,
                        )),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    TextFormField(
                        //validator: Validators.passwordValidator,
                        // onChanged: (value) => controller.user.password = value,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Descripción',
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          labelStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(
                            color: Colors.white,
                            //fontSize: widthSize * errorFormMessage
                          ),
                        ),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          //fontSize: fontSizeTextFormField,
                        )),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    TextFormField(
                        //validator: Validators.passwordValidator,
                        // onChanged: (value) => controller.user.password = value,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Fecha de expiración',
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          labelStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(
                            color: Colors.white,
                            //fontSize: widthSize * errorFormMessage
                          ),
                        ),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          //fontSize: fontSizeTextFormField,
                        )),
                    SizedBox(
                      height: defaultPadding * 2,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Crear Cotización',
                        style: TextStyle(color: primaryColor),
                      ),
                    )
                  ],
                )),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white30,
                    blurRadius: 8.0,
                    offset: Offset(-2.0, 2.0),
                  ),
                ],
                color: secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
              ),
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Mis cotizaciones',
                            style: TextStyle(
                                color: Colors.white70, fontSize: 24.0),
                          ))),
                  Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding * 2),
                        child: Container(
                          child: ListView(
                            children: [
                              QuotationsCard(),
                              QuotationsCard(),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class QuotationsCard extends StatelessWidget {
  const QuotationsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white70,
      child: ListTile(
        title: Row(
          children: [
            Text(
              'Titulo',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Fecha de expiración',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
        subtitle: Text(
          'Decripción',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
