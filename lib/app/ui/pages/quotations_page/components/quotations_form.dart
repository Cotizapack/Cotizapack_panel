import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class QuotationsForm extends StatelessWidget {
  const QuotationsForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
            //validator: Validators.passwordValidator,
            // onChanged: (value) => controller.user.password = value,
            cursorColor: Colors.white70,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Título',
              fillColor: Colors.white70,
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1)),
              labelStyle: TextStyle(color: Colors.white70),
              errorStyle: TextStyle(
                color: Colors.white70,
                //fontSize: widthSize * errorFormMessage
              ),
            ),
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white70,
              //fontSize: fontSizeTextFormField,
            )),
        SizedBox(
          height: defaultPadding,
        ),
        TextFormField(
            //validator: Validators.passwordValidator,
            // onChanged: (value) => controller.user.password = value,
            cursorColor: Colors.white70,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Descripción',
              fillColor: Colors.white70,
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1)),
              labelStyle: TextStyle(color: Colors.white70),
              errorStyle: TextStyle(
                color: Colors.white70,
                //fontSize: widthSize * errorFormMessage
              ),
            ),
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white70,
              //fontSize: fontSizeTextFormField,
            )),
        SizedBox(
          height: defaultPadding,
        ),
        TextFormField(
            //validator: Validators.passwordValidator,
            // onChanged: (value) => controller.user.password = value,
            cursorColor: Colors.white70,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Fecha de expiración',
              fillColor: Colors.white70,
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1)),
              labelStyle: TextStyle(color: Colors.white70),
              errorStyle: TextStyle(
                color: Colors.white70,
                //fontSize: widthSize * errorFormMessage
              ),
            ),
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white70,
              //fontSize: fontSizeTextFormField,
            )),
        SizedBox(
          height: defaultPadding * 2,
        ),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () {},
          child: Text(
            'Crear Cotización',
            style: TextStyle(color: primaryColor),
          ),
        )
      ],
    ));
  }
}
