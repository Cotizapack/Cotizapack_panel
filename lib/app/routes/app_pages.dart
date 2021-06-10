import 'package:cotizaweb/app/bindings/login_binding.dart';
import 'package:cotizaweb/app/bindings/menu_binding.dart';
import 'package:cotizaweb/app/ui/pages/login/login_page.dart';
import 'package:cotizaweb/app/ui/pages/main/main_screen.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => MainScreen(),
      binding: HomeBinding(),
    )
  ];
}
