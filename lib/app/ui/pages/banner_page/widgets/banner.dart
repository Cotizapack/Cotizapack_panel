import 'package:cotizaweb/app/controllers/banner_controller.dart';
import 'package:cotizaweb/app/data/models/banner_model.dart';
import 'package:cotizaweb/app/ui/global_widgets/ImageNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerWidget extends GetView<BannerController> {
  final BannerModel banner;

  BannerWidget({required this.banner});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ImageNetworkPage(url: "https://via.placeholder.com/288x188"),
    );
  }
}
