import 'package:cotizaweb/app/controllers/MenuController.dart';
import 'package:cotizaweb/app/controllers/global_Controller.dart';
import 'package:cotizaweb/app/ui/global_widgets/imagenFile.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Header extends GetView<MenuController> {
  final String title;
  final ResponsiveScreen screen;

  Header({
    required this.title,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!screen.isDesktop)
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: controller.controlMenu,
          ),
        if (!screen.isPhone)
          Text(
            title,
            style: Get.theme.textTheme.headline6,
          ),
        if (!screen.isPhone) Spacer(flex: screen.isDesktop ? 2 : 1),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends GetResponsiveView<GlobalController> {
  @override
  Widget builder() {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: GestureDetector(
              onTap: controller.logout,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.logout), Text("Cerrar Sesion")],
              ),
            ),
          )
        ],
        child: Row(
          children: [
            ImagenFile(
              idImagen: controller.user.logo ?? '',
              width: 30,
              height: 30,
              circular: 50,
            ),
            if (!screen.isPhone)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Text(controller.user.ceoName ?? ""),
              ),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}

class SearchField extends GetView {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
