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
                  borderRadius:
                      BorderRadius.all(Radius.circular(defaultPadding))),
              child: Center(
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Título'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Descripción'),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Fecha de expiración'),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Text('Crear cotizacion'),
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
                  color: secondaryColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(defaultPadding))),
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
                  Expanded(flex: 6, child: Container())
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  // return Container(
  //   color: bgColor,
  //   child: Center(
  //     child: Container(
  //       height: heightSize * 0.65,
  //       width: widthSize * 0.65,
  //       child: Card(
  //         elevation: 5,
  //         child: Row(
  //           children: [
  //             Expanded(
  //               flex: 1,
  //               child: Container(
  //                 decoration: new BoxDecoration(
  //                   gradient: new LinearGradient(
  //                     colors: [
  //                       secondaryColor,
  //                       bgColor,
  //                     ],
  //                     begin: const FractionalOffset(0.0, 0.0),
  //                     end: const FractionalOffset(1.0, 0.0),
  //                     stops: [0.0, 1.0],
  //                     tileMode: TileMode.clamp,
  //                   ),
  //                 ),
  //                 child: Align(
  //                   alignment: Alignment.center,
  //                   child: Image.asset(
  //                     'assets/images/loginvctr.png',
  //                     height: heightSize * 0.5,
  //                     width: widthSize * 0.5,
  //                     semanticLabel: 'test',
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               flex: 1,
  //               child: Container(
  //                 padding: EdgeInsets.only(top: 20),
  //                 color: bgColor,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Image.asset('images/login-form.png',
  //                         height: heightSize * 0.2, width: widthSize * 0.15),
  //                     SizedBox(height: 20),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ),
  // );
}
