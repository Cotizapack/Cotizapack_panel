import 'package:cotizaweb/app/routes/app_pages.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SideMenu extends GetView {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(defaultPadding),
              child: Image.asset("assets/images/logo_skyblue.png"),
            ),
            DrawerListTile(
              title: "Dashbord",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                Get.offNamed(Routes.HOME);
              },
            ),
            DrawerListTile(
              title: "Banners",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {
                Get.offNamed(Routes.BANNERS);
              },
            ),
            DrawerListTile(
              title: "Paquetes",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                Get.offNamed(Routes.PACKAGES);
              },
            ),
            DrawerListTile(
              title: "Categorias",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {
                Get.offNamed(Routes.CATEGORYUSER);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends GetView {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
