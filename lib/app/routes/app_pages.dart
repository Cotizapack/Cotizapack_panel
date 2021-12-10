import 'import.dart';
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
      name: Routes.PASSWORDRESET,
      page: () => PasswordRecoveryPage(),
      binding: PasswordRecoveryBinding(),
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
      name: Routes.PACKAGES,
      page: () => MainScreen(
        screenPrincipal: PackagesPage(),
      ),
      binding: PackagesBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 0),
      ],
    ),
    GetPage(
      name: Routes.CATEGORYUSER,
      page: () => MainScreen(
        screenPrincipal: CategoryUsersPage(),
      ),
      binding: CategoryUsersBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 0),
      ],
    )
  ];
  static final unknownRoute =
      GetPage(name: Routes.NOTFOUND, page: () => NotfoundPage());
}
