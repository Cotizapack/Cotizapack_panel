import 'package:cotizaweb/utils/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiels, percentage;
  final Color? color;

  CloudStorageInfo(
      {this.svgSrc,
      this.title,
      this.totalStorage,
      this.numOfFiels,
      this.percentage,
      this.color});
}

List demoMyFiels = [
  CloudStorageInfo(
    title: "Usuarios",
    numOfFiels: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "activos",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Cotizaciones",
    numOfFiels: 1328,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "realizadas",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Aceptadas",
    numOfFiels: 1328,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "cotizaciones",
    color: Colors.greenAccent,//Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Documents",
    numOfFiels: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
