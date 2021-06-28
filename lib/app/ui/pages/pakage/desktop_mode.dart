import 'package:cotizaweb/app/controllers/Package_controller.dart';
import 'package:cotizaweb/app/ui/pages/dashboard/components/header.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

import 'components/Package_form.dart';
import 'components/Packages_current_list.dart';

class Desktoscreen extends GetView<PackagesController> {
  final ResponsiveScreen screen;

  Desktoscreen({required this.screen});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: "Paquetes",
              screen: screen,
            ),
            SizedBox(height: defaultPadding),
            Expanded(
              child: controller.obx(
                (data) => Row(
                  children: [
                    Expanded(
                      flex: 3,
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
                              child: TablePackages(data: data!),
                            ),
                          )
                        ],
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: PackageForm(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
