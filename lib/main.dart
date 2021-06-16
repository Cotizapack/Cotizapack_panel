import 'package:cotizaweb/app/bindings/splash_binding.dart';
import 'package:cotizaweb/app/ui/pages/splash_page/splash_page.dart';
import 'package:cotizaweb/app/ui/theme/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/theme/theme_dark.dart';

void main() {
  initializeDateFormatting('es_US');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cotizapack Panel',
      defaultTransition: Transition.noTransition,
      darkTheme: appThemelight,
      theme: appThemedark,
      initialRoute: Routes.QUOTATIONS,
      // initialBinding: HomeBinding(),
      //initialRoute: Routes.INITIAL,
      //home: SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
