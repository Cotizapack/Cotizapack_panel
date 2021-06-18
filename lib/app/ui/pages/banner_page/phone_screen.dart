import 'package:cotizaweb/app/controllers/banner_controller.dart';
import 'package:cotizaweb/app/ui/global_widgets/button.dart';
import 'package:cotizaweb/app/ui/pages/banner_page/widgets/formUploadBanner.dart';
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
                  (data) => SingleChildScrollView(
                    child: Obx(
                      () => Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                                    child: FormUploadBanner(),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
