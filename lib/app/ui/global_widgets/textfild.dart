import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class InputText extends GetView {
  final String name;
  final int? maxLines;
  final int? minLines;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? initialValue;
  final TextInputType textInputType;
  final Iterable<String>? autofillHints;
  final void Function(String) onChanged;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  InputText(
      {Key? key,
      required this.name,
      required this.prefixIcon,
      required this.onChanged,
      required this.textInputType,
      this.obscureText,
      this.validator,
      this.suffixIcon,
      this.autofillHints,
      this.controller,
      this.maxLines,
      this.initialValue,
      this.onEditingComplete,
      this.minLines});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          if (validator.toString().length == 0)
            BoxShadow(
              spreadRadius: -2,
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, -5),
            ),
          BoxShadow(
            spreadRadius: -2,
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        onEditingComplete: onEditingComplete,
        minLines: minLines,
        initialValue: initialValue,
        keyboardType: textInputType,
        maxLines: maxLines,
        obscureText: obscureText ?? false,
        validator: validator,
        autofillHints: autofillHints,
        onChanged: onChanged,
        cursorColor: Colors.deepOrange,
        decoration: InputDecoration(
            filled: true,
            fillColor: secondaryColor,
            hintText: name,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Material(
                elevation: 0,
                borderRadius: BorderRadius.circular(30),
                child: prefixIcon,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(15),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
      ),
    );
  }
}
