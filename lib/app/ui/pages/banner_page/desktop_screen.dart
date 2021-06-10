import 'package:cotizaweb/app/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Desktoscreen extends GetView<BannerController> {
  final ResponsiveScreen screen;

  Desktoscreen({required this.screen});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPage'),
      ),
      body: SafeArea(
        child: Text('MyController'),
      ),
    );
  }
}
