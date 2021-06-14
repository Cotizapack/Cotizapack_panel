import 'dart:io';

import 'package:cotizaweb/app/data/common/alert.dart';
import 'package:cotizaweb/app/data/models/banner_model.dart';
import 'package:cotizaweb/app/data/services/banner_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui show Image;

class BannerController extends GetxController
    with StateMixin<List<BannerModel>> {
  final BannerServices mybanners;
  BannerController({required this.mybanners});
  BannerModel banner = BannerModel();
  late DropzoneViewController controllerFile;
  File image = File('');
  RxBool hoverFile = false.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.empty());
    getAllMyBanner();

    super.onInit();
  }

  getAllMyBanner() {
    try {
      change(null, status: RxStatus.loading());
      mybanners.getallMyBanner().then((value) {
        change(value, status: RxStatus.success());
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error("Error: $error"));
      });
    } catch (e) {
      change(null, status: RxStatus.error("Error: $e"));
    }
  }

  updateMyBanner() {
    try {
      change(null, status: RxStatus.loading());
      mybanners.updateMyBanner(file: image, banner: banner).then((value) {
        change(value, status: RxStatus.success());
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error("Error: $error"));
      });
    } catch (e) {
      change(null, status: RxStatus.error("Error: $e"));
    }
  }

  acceptFile(dynamic event) async {
    var mine = await this.controllerFile.getFileMIME(event);

    ///validacion de tipo de formatoi
    bool compare = false;
    [
      "image/gif",
      "image/jpg",
      "image/png",
      "image/jpeg",
    ].map((e) {
      if (mine == e) compare = true;
    }).toList();
    if (!compare) {
      hoverFile.value = false;
      MyAlert.showMyDialog(
          title: 'Error',
          message: 'Archivo no admitido',
          color: Colors.red.withOpacity(0.8));
      return;
    }
    var imageconvert = await this.controllerFile.getFileData(event);

    ///aqui Decodifico la imagen seleccionalda del archivo para obtener sus dimenciones
    ui.Image imagetem = await decodeImageFromList(imageconvert);
    print("Alto: ${imagetem.height}, Ancho:${imagetem.width} ");
    if (validateImage(imagetem.width, imagetem.height))
      return MyAlert.showMyDialog(
        title: 'Exito',
        message: 'Imagen lista para poder subirla',
        color: Colors.green.withOpacity(0.8),
      );
    return MyAlert.showMyDialog(
      title: 'Error',
      message: 'Tamaño de la imagen no admitido',
      color: Colors.red.withOpacity(0.8),
    );
  }

  validateImage(int width, int height) {
    var result = width / height;
    if (result > 1.8) return true;
    hoverFile.value = false;
    return false;
  }

  searchFile() async {
    ///buscar archivo en los ficheros
    var file = await this.controllerFile.pickFiles();
    if (file.isEmpty) return;
    hoverFile.value = true;
    acceptFile(file.first);
  }
}
