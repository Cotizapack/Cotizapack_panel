import 'package:cotizaweb/app/controllers/Package_controller.dart';
import 'package:cotizaweb/app/ui/global_widgets/button.dart';
import 'package:cotizaweb/app/ui/pages/dashboard/components/header.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

import 'components/Package_form.dart';
import 'components/Packages_current_list.dart';

class Movilcreen extends GetView<PackagesController> {
  final ResponsiveScreen screen;

  Movilcreen({required this.screen});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Header(
              title: "Paquetes",
              screen: screen,
            ),
            SizedBox(height: defaultPadding),
            Expanded(
              child: controller.obx(
                (data) => Container(
                  child: SingleChildScrollView(
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          controller.onMovil.value
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  padding: EdgeInsets.all(defaultPadding),
                                  child: SingleChildScrollView(
                                    child: PackageForm(),
                                  ),
                                )
                              : ButtonCuston(
                                  text: "Agregar",
                                  icon: Icon(Icons.add),
                                  funtion: () =>
                                      controller.onMovil.value = true,
                                ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Mis Paquetes',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 24.0),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(defaultPadding * 2),
                                  child: TablePackages(
                                    data: data!,
                                    movil: true,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
