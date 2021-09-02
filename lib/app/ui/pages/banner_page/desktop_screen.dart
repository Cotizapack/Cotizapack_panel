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
              child: Row(
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
                          controller.obx(
                            (data) => Expanded(
                              child: TableBanners(
                                data: data!,
                              ),
                            ),
                            onEmpty: Text('No hay Baneres'),
                            onError: (error) => Text('$error'),
                          )
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.all(defaultPadding),
                      child: SingleChildScrollView(
                        child: FormUploadBanner(),
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
