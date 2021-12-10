import './imports.dart';

class FromPassRecovery extends GetView<PasdwordRecoveryController> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formkey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Cambiar contraseña',
            style: TextStyle(
                color: primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 60,
          ),
          TweenAnimationBuilder(
            duration: const Duration(seconds: 2),
            tween: Tween<double>(begin: 0.1, end: 1.0),
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
          SizedBox(
            height: 60,
          ),
          InputText(
            name: 'Contraseña',
            textInputType: TextInputType.name,
            validator: Validators.passwordValidator,
            prefixIcon: Icon(LineIcons.editAlt),
            onChanged: (val) => controller.password = val,
            obscureText: true,
            maxLines: 1,
          ),
          SizedBox(
            height: 20,
          ),
          InputText(
            name: 'Repetir contraseña',
            textInputType: TextInputType.name,
            validator: Validators.passwordValidator,
            prefixIcon: Icon(LineIcons.editAlt),
            onChanged: (val) => controller.passwordagain = val,
            obscureText: true,
            maxLines: 1,
          ),
          SizedBox(
            height: 50,
          ),
          ButtonCuston(
            funtion: controller.changePassword,
            text: "Aceptar",
          )
        ],
      ),
    );
  }
}
