import 'package:cotizaweb/app/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabletPage extends GetView<BannerController> {
  final ResponsiveScreen screen;

  TabletPage({required this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola Mundo'),
      ),
      body: SafeArea(
        child: Text('Tablet'),
      ),
    );
  }
}
