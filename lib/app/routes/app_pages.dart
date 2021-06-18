import 'package:cotizaweb/app/bindings/banner_binding.dart';
import 'package:cotizaweb/app/bindings/dashboard_binding.dart';
import 'package:cotizaweb/app/bindings/login_binding.dart';
import 'package:cotizaweb/app/bindings/pakage_binding.dart';
import 'package:cotizaweb/app/bindings/splash_binding.dart';
import 'package:cotizaweb/app/middleware/routerchecked_midelware.dart';
import 'package:cotizaweb/app/ui/pages/banner_page/banner_page.dart';
import 'package:cotizaweb/app/ui/pages/dashboard/dashboard_screen.dart';
import 'package:cotizaweb/app/ui/pages/login/login_page.dart';
import 'package:cotizaweb/app/ui/pages/main/main_screen.dart';
import 'package:cotizaweb/app/ui/pages/notfound_page/notfound_page.dart';
import 'package:cotizaweb/app/ui/pages/pakage/pakage_page.dart';
import 'package:cotizaweb/app/ui/pages/splash_page/splash_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => MainScreen(
        screenPrincipal: DashboardScreen(),
      ),
      binding: DashboardBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 0),
      ],
    ),
    GetPage(
      name: Routes.BANNERS,
      page: () => MainScreen(
        screenPrincipal: BannerPage(),
      ),
      binding: BannerBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 0),
      ],
    ),
    GetPage(
      name: Routes.PAKAGES,
      page: () => MainScreen(
        screenPrincipal: PakagesPage(),
      ),
      binding: PakagesBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 0),
      ],
    )
  ];
  static final unknownRoute =
      GetPage(name: Routes.NOTFOUND, page: () => NotfoundPage());
}
