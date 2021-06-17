import 'package:cotizaweb/app/controllers/banner_controller.dart';
import 'package:cotizaweb/app/ui/pages/banner_page/widgets/formUploadBanner.dart';
import 'package:cotizaweb/app/ui/pages/dashboard/components/header.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/table_banners.dart';

///Pantalla para Desktops
class Desktoscreen extends GetView<BannerController> {
  final ResponsiveScreen screen;

  Desktoscreen({required this.screen});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Header(
              title: "Banners",
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
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding),
                            child: Text(
                              'Mis Banners',
                              style: Get.theme.textTheme.headline6,
                            ),
                          ),
                          Expanded(
                            child: TableBanners(
                              data: data!,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(defaultPadding),
                        child: SingleChildScrollView(
                          child: FormUploadBanner(),
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
