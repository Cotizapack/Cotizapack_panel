import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/categoryusers_controller.dart';
import 'desktop_mode.dart';
import 'mobile_mode.dart';

class CategoryUsersPage extends GetResponsiveView<CategoryUsersController> {
  Widget? phone() {
    return Movilcreen(screen: screen);
  }

  @override
  Widget desktop() {
    return Desktoscreen(screen: screen);
  }
}
