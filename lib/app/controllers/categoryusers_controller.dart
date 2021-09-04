
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
  RxBool hoverFile = false.obs;
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


  /* ---------------------------- Limpiar los datos --------------------------- */
  limpiar() {
    sendData.value = false;
    hoverFile.value = false;
    editar = false;
    userCategory = UserCategory();
    onMovil.value = false;
    nameController.clear();
    descriptionController.clear();
  }

  /* ---------------------------- fin eliminar data --------------------------- */
}
  