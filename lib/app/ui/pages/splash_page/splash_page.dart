import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: new SafeArea(
        child: new Center(
          child: TweenAnimationBuilder(
            duration: const Duration(seconds: 2),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            builder: (_, double value, Widget? child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/logo_colors.png',
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
