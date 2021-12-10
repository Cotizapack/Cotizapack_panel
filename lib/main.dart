import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/bindings/splash_binding.dart';
import 'app/ui/theme/theme_light.dart';
import 'app/controllers/MenuController.dart';
import 'app/controllers/global_Controller.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/theme/theme_dark.dart';

void main() {
  Get.put(GlobalController());
  Get.put(MenuController());
  initializeDateFormatting('es_US');
  setPathUrlStrategy();
  // await Get.putAsync(() => TranslationService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cotizapack Panel',
      defaultTransition: Transition.noTransition,
      theme: appThemelight,
      darkTheme: appThemedark,
      themeMode: ThemeMode.dark,
      initialRoute: Routes.INITIAL,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      unknownRoute: AppPages.unknownRoute,
    );
  }
}
