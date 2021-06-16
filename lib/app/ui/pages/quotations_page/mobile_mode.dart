import 'package:cotizaweb/app/ui/pages/dashboard/components/header.dart';
import 'package:cotizaweb/app/ui/pages/quotations_page/desktop_mode.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

import 'components/quotations_card.dart';
import 'components/quotations_current_list.dart';
import 'components/quotations_form.dart';

Widget? mobileMode(ResponsiveScreen screen) {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  return Scaffold(
    backgroundColor: Get.theme.backgroundColor,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    body: Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Header(
            title: "Cotizaciones",
            screen: screen,
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white10,
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
                        child: QuotationsCurrentList(
                          items: items,
                        ),
                      ))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white10,
                  blurRadius: 8.0,
                  offset: Offset(-2.0, 2.0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: QuotationsForm(),
            ),
          ),
        ],
      ),
    ),
  );
}
