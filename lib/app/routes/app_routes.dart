part of './app_pages.dart';

abstract class Routes {
  ///Ruta Inicial
  static const INITIAL = '/';

  ///Ruta Home
  static const HOME = '/home';

  ///Ruta iniciar Secion
  static const LOGIN = '/login';

  ///Ruta Banners
  static const BANNERS = '/banners';

  ///Ruta Paketes
  static const PackageS = '/Packages';

  ///Ruta no encontrada
  static const NOTFOUND = '/notfound';

  ///resetear contrsaeña de los usuarios de la app movil.
  static const PASSWORDRESET = '/auth/recovery/reset';
}
