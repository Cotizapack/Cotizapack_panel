import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  GlobalKey<ScaffoldState>? _scaffoldKey;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey!;

  @override
  void onInit() async {
    if (_scaffoldKey == null) _scaffoldKey = GlobalKey<ScaffoldState>();
    super.onInit();
  }

  void controlMenu() {
    if (!_scaffoldKey!.currentState!.isDrawerOpen) {
      _scaffoldKey!.currentState!.openDrawer();
    }
  }

  GlobalKey<ScaffoldState> newkey() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    return _scaffoldKey!;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
