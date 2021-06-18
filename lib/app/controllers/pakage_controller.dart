import 'dart:typed_data';

import 'package:cotizaweb/app/data/common/alert.dart';
import 'package:cotizaweb/app/data/models/PakageModel.dart';
import 'package:cotizaweb/app/data/provider/storage.dart';
import 'package:cotizaweb/app/data/services/package_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'dart:ui' as ui show Image;

class PakagesController extends GetxController
    with StateMixin<List<Pakageclass>> {
  Pakageclass pakages = Pakageclass();
  late DropzoneViewController controllerFile;
  final PakageRepository mypakage;
  RxBool hoverFile = false.obs;
  RxBool sendData = false.obs;
  RxBool onsale = false.obs;

  String fileName = '';
  List<int> image = <int>[];
  Rx<Uint8List> imagenUploaded = Uint8List.fromList([]).obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool editar = false;
  bool onEdit = false;
  RxBool onMovil = false.obs;
  /* ---------------------------- Datos de la Fecha --------------------------- */
  String selectedDate = '';
  String dateCount = '';
  String range = '';
  String rangeCount = '';
  DateRangePickerController dateTimeController = DateRangePickerController();
  /* ----------------------------- fin datos fecha ---------------------------- */

  /* -------------------------- controladores Texbox -------------------------- */
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  /* -------------------------- controladores Texbox -------------------------- */

  PakagesController({required this.mypakage});
  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    getAllMyPakages();
    pakages.updatedAt = DateTime.now().millisecondsSinceEpoch;
    pakages.expirationPromo =
        DateTime.now().add(Duration(days: 3)).millisecondsSinceEpoch;
    super.onInit();
  }

  getAllMyPakages() {
    try {
      change(null, status: RxStatus.loading());
      mypakage.getPackages().then((value) {
        if (value == null)
          return change(null, status: RxStatus.error("Error: null"));
        change(value, status: RxStatus.success());
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error("Error: $error"));
      });
    } catch (e) {
      print("$e");
      change(null, status: RxStatus.error("Error: $e"));
    } finally {
      limpiar();
    }
  }

  /* ----------------------- Guardar en la base de datos ---------------------- */
  saveMyPakage() async {
    try {
      if (!hoverFile.value)
        return MyAlert.showMyDialog(
          title: 'Error',
          message: 'Seleccione una imagen primero',
          color: Colors.red.withOpacity(0.8),
        );
      sendData.value = true;
      update(['formUpload']);
      pakages.onSale = onsale.value;
      pakages.createAt = DateTime.now().millisecondsSinceEpoch;

      var data =
          Isolateparam(pakage: pakages, image: image, filename: fileName);
      var result = await compute<Isolateparam, List<Pakageclass>?>(
          mypakage.savePackage, data);

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

  updateMyPakage() async {
    try {
      sendData.value = true;
      update(['formUpload']);
      pakages.updatedAt = DateTime.now().millisecondsSinceEpoch;
      var data =
          Isolateparam(pakage: pakages, image: image, filename: fileName);
      var result = await compute<Isolateparam, List<Pakageclass>?>(
          mypakage.updatePackages, data);

      sendData.value = false;
      if (result == null)
        return MyAlert.showMyDialog(
          title: 'Error',
          message: 'Error al actualizar el Pakage',
          color: Colors.red.withOpacity(0.8),
        );
      MyAlert.showMyDialog(
        title: 'Exito',
        message: 'Actualizacion Exitoso.',
        color: Colors.green.withOpacity(0.8),
      );
      change(result, status: RxStatus.success());
      limpiar();
    } catch (e) {
      change(null, status: RxStatus.error("Error: $e"));
    } finally {
      limpiar();
    }
  }

  setdataEdit(Pakageclass pakageEdit) async {
    pakages = pakageEdit;
    onMovil.value = true;
    nameController.text = pakageEdit.name!;
    descriptionController.text = pakageEdit.description!;
    quantityController.text = pakageEdit.quotations!.toString();
    priceController.text = pakageEdit.price!.toString();
    percentageController.text = pakageEdit.percentage!.toString();
    imagenUploaded.value =
        await MyStorage().getFilePreview(fileId: pakageEdit.image!) ??
            Uint8List.fromList([]);
    editar = true;
    dateTimeController.selectedRanges = <PickerDateRange>[
      PickerDateRange(
        DateTime.fromMillisecondsSinceEpoch(pakageEdit.updatedAt!),
        DateTime.fromMillisecondsSinceEpoch(pakageEdit.expirationPromo!),
      )
    ];
    update(['formUpload']);
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      var startDate = args.value.startDate as DateTime;
      var endDate = args.value.startDate as DateTime;
      pakages.createAt = startDate.millisecondsSinceEpoch;
      pakages.expirationPromo = endDate.millisecondsSinceEpoch;
    } else if (args.value is DateTime) {
      selectedDate = args.value.toString();
      var startDate = args.value.startDate as DateTime;
      var endDate = args.value.startDate as DateTime;
      pakages.createAt = startDate.millisecondsSinceEpoch;
      pakages.expirationPromo = endDate.millisecondsSinceEpoch;
    } else if (args.value is List<DateTime>) {
      dateCount = args.value.length.toString();
    } else {
      rangeCount = args.value.length.toString();
    }
  }

  /* ---------------------------- fin eliminar data --------------------------- */
  acceptFile(dynamic event) async {
    var mine = await this.controllerFile.getFileMIME(event);
    GetUtils.nil(null);

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

  /* ------------- borrar Pakage de la base de datos con la imagen ------------ */
  deletePakage(Pakageclass pakage) {
    try {
      Get.defaultDialog(
        title: "Eliminar Pakage",
        content: Column(
          children: [
            Text(
              "Se Eliminar el Pakage ${pakage.name}",
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
              deletePakageConfirmado(pakage);
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

  deletePakageConfirmado(Pakageclass pakage) async {
    try {
      var data = Isolateparam(pakage: pakage);
      var result = await compute<Isolateparam, List<Pakageclass>?>(
          mypakage.detelePackages, data);
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

  /* ---------------------------- Limpiar los datos --------------------------- */
  limpiar() {
    sendData.value = false;
    hoverFile.value = false;
    editar = false;
    imagenUploaded.value = Uint8List.fromList([]);
    pakages = Pakageclass();
    dateTimeController.selectedRanges = <PickerDateRange>[
      PickerDateRange(DateTime.now(), DateTime.now().add(Duration(days: 3)))
    ];
    onMovil.value = false;
    nameController.clear();
    descriptionController.clear();
    quantityController.clear();
    priceController.clear();
    percentageController.clear();
    update(["formUpload"]);
  }

  /* ---------------------------- fin eliminar data --------------------------- */

}

class Isolateparam {
  final Pakageclass? pakage;
  final List<int>? image;
  final String? filename;

  Isolateparam({this.pakage, this.image, this.filename});
}
