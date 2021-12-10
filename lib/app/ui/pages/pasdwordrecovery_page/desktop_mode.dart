import './components/imports.dart';

class DesktopScream extends GetView<PasdwordRecoveryController> {
  final ResponsiveScreen screen;

  DesktopScream({required this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Container(
        width: screen.width,
        height: screen.height,
        child: SafeArea(
          child: Center(
            child: Container(
              width: screen.width / 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: SingleChildScrollView(
                  child: FromPassRecovery(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
