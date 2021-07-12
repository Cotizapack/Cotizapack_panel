import 'dart:async';
import 'dart:typed_data';

import 'package:cotizaweb/app/data/common/alert.dart';
import 'package:cotizaweb/app/data/models/banner_model.dart';
import 'package:cotizaweb/app/data/models/isolatemodel.dart';
import 'package:cotizaweb/app/data/provider/storage.dart';
import 'package:cotizaweb/app/data/services/banner_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui show Image;

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BannerController extends GetxController
    with StateMixin<List<BannerModel>> {
  final BannerServices mybanners;
  BannerController({required this.mybanners});
  BannerModel banner = BannerModel();
  late DropzoneViewController controllerFile;
  List<int> image = <int>[];
  String fileName = '';
  RxBool hoverFile = false.obs;
  RxBool sendData = false.obs;
  Rx<Uint8List> imagenUploaded = Uint8List.fromList([]).obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool editar = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  /* ---------------------------- Datos de la Fecha --------------------------- */
  String selectedDate = '';
  String dateCount = '';
  String range = '';
  String rangeCount = '';
  DateRangePickerController dateTimeController = DateRangePickerController();
  /* ----------------------------- fin datos fecha ---------------------------- */

  bool onEdit = false;
  RxBool onMovil = false.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.empty());
    getAllMyBanner();
    banner.createAt = DateTime.now().millisecondsSinceEpoch;
    banner.showAt = DateTime.now()
        .add(
          Duration(days: 3),
        )
        .millisecondsSinceEpoch;
    super.onInit();
  }

  getAllMyBanner() {
    try {
      change(null, status: RxStatus.loading());
      mybanners.getallMyBanner().then((value) {
        if (value!.isEmpty) return change(null, status: RxStatus.empty());
        change(value, status: RxStatus.success());
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error("Error: $error"));
      });
    } catch (e) {
      change(null, status: RxStatus.error("Error: $e"));
    } finally {
      limpiar();
    }
  }

  updateMyBanner() async {
    try {
      sendData.value = true;
      update(['formUpload']);
      var data = Isolateparam(banner: banner, image: image, filename: fileName);
      var result = await compute<Isolateparam, List<BannerModel>?>(
          mybanners.updateMyBanner, data);

      sendData.value = false;
      if (result == null)
        return MyAlert.showMyDialog(
          title: 'Error',
          message: 'Error al actualizar el banner',
          color: Colors.red.withOpacity(0.8),
        );
      MyAlert.showMyDialog(
        title: 'Exito',
        message: 'Actualizacion Exitoso.',
        color: Colors.green.withOpacity(0.8),
      );
      change(result, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error("Error: $e"));
    } finally {
      limpiar();
    }
  }

  setdataEdit(BannerModel bannerEdit) async {
    banner = bannerEdit;
    onMovil.value = true;
    titleController.text = bannerEdit.title;
    descriptionController.text = bannerEdit.description;
    imagenUploaded.value =
        await MyStorage().getFilePreview(fileId: bannerEdit.image!) ??
            Uint8List.fromList([]);
    editar = true;
    dateTimeController.selectedRanges = <PickerDateRange>[
      PickerDateRange(
        DateTime.fromMillisecondsSinceEpoch(bannerEdit.createAt!),
        DateTime.fromMillisecondsSinceEpoch(bannerEdit.showAt!),
      )
    ];
    update(['formUpload']);
  }

  /* ----------------------- Guardar en la base de datos ---------------------- */
  saveMyBanner() async {
    try {
      if (!hoverFile.value)
        return MyAlert.showMyDialog(
          title: 'Error',
          message: 'Seleccione una imagen primero',
          color: Colors.red.withOpacity(0.8),
        );
      sendData.value = true;
      update(['formUpload']);
      var data = Isolateparam(banner: banner, image: image, filename: fileName);
      var result = await compute<Isolateparam, List<BannerModel>?>(
          mybanners.saveMyBanner, data);

      sendData.value = false;
      if (result == null)
        return MyAlert.showMyDialog(
          title: 'Error',
          message: 'Error al subir la Imagen',
          color: Colors.red.withOpacity(0.8),
        );
      MyAlert.showMyDialog(
        title: 'Exito',
        message: 'Registro Exitoso.',
        color: Colors.green.withOpacity(0.8),
      );

      change(result, status: RxStatus.success());
    } catch (e) {
      MyAlert.showMyDialog(
        title: 'Error',
        message: 'Error: $e',
        color: Colors.red.withOpacity(0.8),
      );
    } finally {
      limpiar();
    }
  }

  /* ------------- borrar banner de la base de datos con la imagen ------------ */
  deleteBanner(BannerModel banner) {
    try {
      Get.defaultDialog(
        title: "Eliminar Banner",
        content: Column(
          children: [
            Text(
              "Se Eliminar el banner ${banner.title}",
              maxLines: 2,
            ),
            Text("¿Esta Seguro?"),
          ],
        ),
        cancel: TextButton(
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Get.theme.accentColor,
                    width: 2,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(100)),
          ),
          onPressed: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Cancelar",
              style: TextStyle(color: Get.theme.accentColor),
            ),
          ),
        ),
        confirm: TextButton(
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Ok",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () async {
              Get.back();
              deletebannerConfirmado(banner);
            }),
      );
    } catch (e) {
      MyAlert.showMyDialog(
        title: 'Error',
        message: 'Error: $e',
        color: Colors.red.withOpacity(0.8),
      );
    } finally {
      limpiar();
    }
  }

  deletebannerConfirmado(BannerModel banner) async {
    try {
      var data = Isolateparam(banner: banner);
      var result = await compute<Isolateparam, List<BannerModel>?>(
          mybanners.deleteMyBanner, data);
      if (result == null)
        return MyAlert.showMyDialog(
          title: 'Error',
          message: 'Error al Eliminar la Imagen',
          color: Colors.red.withOpacity(0.8),
        );
      MyAlert.showMyDialog(
        title: 'Exito',
        message: 'Eliminacion Exitosa.',
        color: Colors.green.withOpacity(0.8),
      );
      change(result, status: RxStatus.success());
      limpiar();
    } catch (e) {} finally {
      limpiar();
    }
  }

/* ---------------------------- Limpiar los datos --------------------------- */
  limpiar() {
    sendData.value = false;
    hoverFile.value = false;
    titleController.clear();
    editar = false;
    descriptionController.clear();
    imagenUploaded.value = Uint8List.fromList([]);
    banner = BannerModel();
    dateTimeController.selectedRanges = [
      PickerDateRange(DateTime.now(), DateTime.now().add(Duration(days: 3)))
    ];
    onMovil.value = false;
    update(["formUpload"]);
  }

  /* ---------------------------- fin eliminar data --------------------------- */
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
    fileName = await this.controllerFile.getFilename(event);
    /* -------------------------------------------------------------------------- */
    ///aqui Decodifico la imagen seleccionalda del archivo para obtener sus dimenciones
    ui.Image imagetem = await decodeImageFromList(imageconvert);
    if (validateImage(imagetem.width, imagetem.height)) {
      imagenUploaded.value = imageconvert;
      image = List.from(imageconvert);
      return MyAlert.showMyDialog(
        title: 'Exito',
        message: 'Imagen lista para poder subirla',
        color: Colors.green.withOpacity(0.8),
      );
    }
    return MyAlert.showMyDialog(
      title: 'Error',
      message: 'Tamaño de la imagen no admitido',
      color: Colors.red.withOpacity(0.8),
    );
  }

  ////* ---------------------------- radio de aspecto ---------------------------- */
  validateImage(int width, int height) {
    var result = width / height;
    if (result > 1.8) return true;
    hoverFile.value = false;
    return false;
  }

  ////* --------------------- buscar archivo en los ficheros --------------------- */
  searchFile() async {
    var file = await this.controllerFile.pickFiles();
    if (file.isEmpty) return;
    hoverFile.value = true;
    acceptFile(file.first);
  }

  /// The argument value will return the changed date as [DateTime] when the
  /// widget [SfDateRangeSelectionMode] set as single.
  ///
  /// The argument value will return the changed dates as [List<DateTime>]
  /// when the widget [SfDateRangeSelectionMode] set as multiple.
  ///
  /// The argument value will return the changed range as [PickerDateRange]
  /// when the widget [SfDateRangeSelectionMode] set as range.
  ///
  /// The argument value will return the changed ranges as
  /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
  /// multi range.
  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      var startDate = args.value.startDate as DateTime;
      var endDate = args.value.startDate as DateTime;
      banner.createAt = startDate.millisecondsSinceEpoch;
      banner.showAt = endDate.millisecondsSinceEpoch;
    } else if (args.value is DateTime) {
      selectedDate = args.value.toString();
      var startDate = args.value.startDate as DateTime;
      var endDate = args.value.startDate as DateTime;
      banner.createAt = startDate.millisecondsSinceEpoch;
      banner.showAt = endDate.millisecondsSinceEpoch;
    } else if (args.value is List<DateTime>) {
      dateCount = args.value.length.toString();
    } else {
      rangeCount = args.value.length.toString();
    }
  }
}
