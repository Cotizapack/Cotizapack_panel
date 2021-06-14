import 'package:cotizaweb/app/controllers/banner_controller.dart';
import 'package:cotizaweb/app/ui/pages/banner_page/widgets/DropZone.dart';
import 'package:cotizaweb/app/ui/pages/banner_page/widgets/table_banners.dart';
import 'package:cotizaweb/app/ui/pages/dashboard/components/header.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Phonescreen extends GetView<BannerController> {
  final ResponsiveScreen screen;

  Phonescreen({required this.screen});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  (data) => Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Form(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Text(
                                    'Agregar Baner',
                                    style: Get.theme.textTheme.headline6,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: DropZoneWidget(
                                    height: screen.height / 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Center(
                              child: Text(
                                'Mis Banners',
                                style: Get.theme.textTheme.headline6,
                              ),
                            ),
                            TableBanners(
                              data: data!,
                              movil: true,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
