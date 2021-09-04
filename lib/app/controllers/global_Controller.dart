import 'dart:ui';

import 'package:cotizaweb/app/data/common/get_storage.dart';
import 'package:cotizaweb/app/data/models/MyFiles.dart';
import 'package:cotizaweb/app/data/models/PackageModel.dart';
import 'package:cotizaweb/app/data/models/categories.dart';
import 'package:cotizaweb/app/data/models/session_model.dart';
import 'package:cotizaweb/app/data/models/user_data.dart';
import 'package:cotizaweb/app/data/services/dashboar_services.dart';
import 'package:cotizaweb/app/data/services/user.dart';
import 'package:cotizaweb/app/routes/app_pages.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  UserData user = UserData(
      category: UserCategory(
          id: '', collection: '', enable: false, name: '', description: ''));
  UserRepository _userRepository = UserRepository();
  RxList<Packageclass> package = <Packageclass>[].obs;
  Session session = Session();
  RxList<ClouddataInfo> datacardDashboard = [
    ClouddataInfo(
      title: "Usuarios",
      numOfFiels: 0,
      color: primaryColor,
    ),
    ClouddataInfo(
      title: "Cotizaciones",
      numOfFiels: 0,
      color: Color(0xFFFFA113),
    ),
    ClouddataInfo(
      title: "Aceptadas",
      numOfFiels: 0,
      color: Colors.greenAccent, //Color(0xFFA4CDFF),
    ),
    ClouddataInfo(
      title: "Paquetes",
      numOfFiels: 0,
      color: Color(0xFF007EE5),
    ),
    ClouddataInfo(
      title: "Vendidos",
      numOfFiels: 0,
      color: Colors.red.shade400,
    ),
  ].obs;
  @override
  onInit() async {
    getData();
    super.onInit();
  }

  logout() {
    _userRepository.logout().then((value) async {
      await MyGetStorage().eraseData();
      user = UserData(
          category: UserCategory(
              id: '',
              collection: '',
              enable: false,
              name: '',
              description: ''));
      Get.offNamed(Routes.INITIAL);
    });
  }

  getData() async {
    package.clear();
    datacardDashboard[0].numOfFiels = await DashBoarServices().getCounUsers();
    datacardDashboard[1].numOfFiels =
        await DashBoarServices().getcountQuotation();
    datacardDashboard[2].numOfFiels =
        await DashBoarServices().getcountQuotation(status: 1);
    datacardDashboard[3].numOfFiels =
        await DashBoarServices().getcountapackages();
    datacardDashboard[4].numOfFiels = await DashBoarServices().getBuypackages();
    datacardDashboard.refresh();
    DashBoarServices().getLastPakages().then((value) {
      if (value != null) package.addAll(value);
    });
  }
}
