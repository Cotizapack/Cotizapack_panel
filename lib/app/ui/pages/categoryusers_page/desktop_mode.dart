import 'package:cotizaweb/app/controllers/categoryusers_controller.dart';
import 'package:cotizaweb/app/ui/pages/dashboard/components/header.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

import 'components/Packages_current_list.dart';
import 'components/category_form.dart';

class Desktoscreen extends GetView<CategoryUsersController> {
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
                      child: Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Mis Categorias',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 24.0),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(defaultPadding * 2),
                                child: TableCategory(data: data!),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: CategoryForm(),
                          ),
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
