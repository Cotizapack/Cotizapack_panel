import 'package:cotizaweb/app/controllers/banner_controller.dart';
import 'package:cotizaweb/app/ui/pages/banner_page/widgets/dropzone.dart';
import 'package:cotizaweb/app/ui/pages/dashboard/components/header.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/table_banners.dart';

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
                          Expanded(
                            child: Text(
                              'Mis Banners',
                              style: Get.theme.textTheme.headline6,
                            ),
                          ),
                          TableBanners(
                            data: data!,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Form(
                          child: Column(
                            children: [
                              Expanded(
                                child: Text('Agregar Baner'),
                              ),
                              Expanded(
                                flex: 6,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: DropZoneWidget(
                                        height: 160,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
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

/*
ListView.builder(
  itemCount: data!.length,
  shrinkWrap: true,
  itemBuilder: (context, index) => Container(
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        ImagenFile(
          idImagen: data[index].image!,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 9,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                data[index].title!,
                style:
                    Get.theme.textTheme.headline4,
              ),
              Text(
                data[index].description!,
                style:
                    Get.theme.textTheme.headline6,
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),
                          

 */
