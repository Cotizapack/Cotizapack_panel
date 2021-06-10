import 'package:cotizaweb/app/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Phonescreen extends GetView<BannerController> {
  final ResponsiveScreen screen;

  Phonescreen({required this.screen});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'phone',
        ),
      ),
      body: SafeArea(
        child: Text(
          'phone',
        ),
      ),
    );
  }
}
