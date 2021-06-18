import 'package:cotizaweb/app/controllers/pakage_controller.dart';
import 'package:cotizaweb/app/ui/pages/dashboard/components/header.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

import 'components/pakages_current_list.dart';

class Movilcreen extends GetView<PakagesController> {
  final ResponsiveScreen screen;

  Movilcreen({required this.screen});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding * 2),
        child: Column(
          children: [
            Header(
              title: "Paquetes",
              screen: screen,
            ),
            SizedBox(height: defaultPadding),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(defaultPadding)),
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
                        child: null, // PakageForm(),
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
                            color: Colors.white10,
                            blurRadius: 8.0,
                            offset: Offset(-2.0, 2.0),
                          ),
                        ],
                        color: secondaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(defaultPadding)),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Mis Paquetes',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 24.0),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(defaultPadding * 2),
                              child: TablePakages(data: []),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
