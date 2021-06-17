import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

ClipRRect buildBorder({required Widget child}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      padding: EdgeInsets.all(10),
      child: DottedBorder(
        radius: Radius.circular(20),
        borderType: BorderType.RRect,
        color: Colors.white,
        padding: EdgeInsets.zero,
        child: child,
      ),
    ),
  );
}
