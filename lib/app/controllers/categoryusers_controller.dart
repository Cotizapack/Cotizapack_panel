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
  RxBool enabled = false.obs;

  String fileName = '';
  List<int> image = <int>[];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool editar = false.obs;
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
          message: 'Error al guardar',
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

  /* ----------------------- Actualizar en la base de datos ---------------------- */
  updateUserCategory() async {
    try {
      sendData.value = true;
      var result = await categoryUserServices.updateCategoryUser(userCategory);
      sendData.value = false;
      if (result == null)
        return MyAlert.showMyDialog(
          title: 'Error',
          message: 'Error al actualizar la categoria',
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

  /* ----------------------- change enable user category ---------------------- */
  changeEnable(UserCategory data) {
    try {
      data.enable = !data.enable!;
      userCategory = data;

      updateUserCategory();
    } catch (e) {
      change(null, status: RxStatus.error("Error: $e"));
    }
  }

  /* ------------- borrar Package de la base de datos con la imagen ------------ */
  deletePackage(UserCategory userCategory) {
    try {
      Get.defaultDialog(
        title: "Eliminar Categoria",
        content: Column(
          children: [
            Text(
              "Se Eliminar la Categoria ${userCategory.name}",
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
                    color: Get.theme.colorScheme.primary,
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
              style: TextStyle(color: Get.theme.colorScheme.primary),
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
              deletePackageConfirmado(userCategory);
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

  deletePackageConfirmado(UserCategory userCategory) async {
    try {
      var result = await categoryUserServices.deteleCategoryUser(userCategory);
      if (result == null)
        return MyAlert.showMyDialog(
          title: 'Error',
          message: 'Error al Eliminar la categoria',
          color: Colors.red.withOpacity(0.8),
        );
      MyAlert.showMyDialog(
        title: 'Exito',
        message: 'Eliminacion Exitosa.',
        color: Colors.green.withOpacity(0.8),
      );
      change(result, status: RxStatus.success());
      limpiar();
    } catch (e) {
    } finally {
      limpiar();
    }
  }

  /* ---------------------------- Limpiar los datos --------------------------- */
  limpiar() {
    sendData.value = false;
    editar.value = false;
    userCategory = UserCategory();
    onMovil.value = false;
    nameController.clear();
    descriptionController.clear();
  }
  /* ---------------------------- fin eliminar data --------------------------- */

  setdataEdit(UserCategory userCategory) {
    this.userCategory = userCategory;
    nameController.text = userCategory.name!;
    descriptionController.text = userCategory.description!;
    this.enabled.value = userCategory.enable!;
    editar.value = true;
  }
}
