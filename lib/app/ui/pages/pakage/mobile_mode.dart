import 'package:cotizaweb/app/controllers/pakage_controller.dart';
import 'package:cotizaweb/app/ui/global_widgets/button.dart';
import 'package:cotizaweb/app/ui/pages/dashboard/components/header.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

import 'components/pakage_form.dart';
import 'components/pakages_current_list.dart';

class Movilcreen extends GetView<PakagesController> {
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
                (data) => SingleChildScrollView(
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
                                  child: PakageForm(),
                                ),
                              )
                            : ButtonCuston(
                                text: "Agregar",
                                icon: Icon(Icons.add),
                                funtion: () => controller.onMovil.value = true,
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
                                child: TablePakages(
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
          ],
        ),
      ),
    );
  }
}
