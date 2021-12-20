import './components/imports.dart';

class Movilcreen extends GetView<PasdwordRecoveryController> {
  final ResponsiveScreen screen;

  Movilcreen({required this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Container(
        width: screen.width,
        height: screen.height,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Container(
                  width: screen.width * 0.8,
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
