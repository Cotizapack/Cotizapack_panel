import './components/imports.dart';

class PasswordRecoveryPage
    extends GetResponsiveView<PasdwordRecoveryController> {
  PasswordRecoveryPage()
      : super(settings: ResponsiveScreenSettings(tabletChangePoint: 900));
  @override
  Widget? phone() {
    return Movilcreen(screen: screen);
  }

  @override
  Widget? tablet() {
    return Movilcreen(screen: screen);
  }

  @override
  Widget? desktop() {
    return DesktopScream(screen: screen);
  }
}
