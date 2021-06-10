import 'package:cotizaweb/app/ui/theme/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/theme/theme_dark.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cotizapack Panel',
      darkTheme: appThemelight,
      theme: appThemedark,
      initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
    );
  }
}
