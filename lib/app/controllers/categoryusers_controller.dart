
import 'package:cotizaweb/app/data/common/alert.dart';
import 'package:cotizaweb/app/data/models/categories.dart';
import 'package:cotizaweb/app/data/services/categoryuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class CategoryUsersController extends GetxController
   with StateMixin<List<UserCategory>> {
  UserCategory userCategory = UserCategory();
  late DropzoneViewController controllerFile;
  final CategoryUserServices categoryUserServices; 
  RxBool sendData = false.obs;
  RxBool onsale = false.obs;

  String fileName = '';
  List<int> image = <int>[];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool editar = false;
  bool onEdit = false;
  RxBool onMovil = false.obs;

  /* -------------------------- controladores Texbox -------------------------- */
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  /* -------------------------- controladores Texbox -------------------------- */ 

  CategoryUsersController({required this.categoryUserServices});

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    getAllUserCategory();
    super.onInit();
  }

  getAllUserCategory() {
    try {
      change(null, status: RxStatus.loading());
      categoryUserServices.getCategoryUser().then((value) {
        if (value == null)
          return change(null, status: RxStatus.error("Error: null"));
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

  /* ----------------------- Guardar en la base de datos ---------------------- */
  saveUserCategory() async {
    try {
      sendData.value = true;
      var result = await categoryUserServices.saveCategoryUser(userCategory);
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


  /* ---------------------------- Limpiar los datos --------------------------- */
  limpiar() {
    sendData.value = false;
    editar = false;
    userCategory = UserCategory();
    onMovil.value = false;
    nameController.clear();
    descriptionController.clear();
  }

  /* ---------------------------- fin eliminar data --------------------------- */
}
  