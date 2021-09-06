import 'package:cotizaweb/app/controllers/categoryusers_controller.dart';
import 'package:cotizaweb/app/data/common/validators.dart';
import 'package:cotizaweb/app/ui/global_widgets/button.dart';
import 'package:cotizaweb/app/ui/global_widgets/textfild.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class CategoryForm extends GetView<CategoryUsersController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryUsersController>(
      id: "formUpload",
      builder: (_) => Form(
        key: controller.formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: Text(
                'Agregar Categorita',
                style: Get.theme.textTheme.headline6,
              ),
            ),
            !controller.sendData.value
                ? Column(
                    children: [
                      InputText(
                        name: 'Nombre',
                        controller: controller.nameController,
                        textInputType: TextInputType.name,
                        validator: Validators.nameValidator,
                        prefixIcon: Icon(LineIcons.edit),
                        onChanged: (val) => controller.userCategory.name = val,
                      ),
                      InputText(
                        name: 'Descripcion',
                        controller: controller.descriptionController,
                        textInputType: TextInputType.name,
                        validator: Validators.nameValidator,
                        prefixIcon: Icon(LineIcons.editAlt),
                        onChanged: (val) =>
                            controller.userCategory.description = val,
                      ),
                      Obx(
                        () => Container(
                          clipBehavior: Clip.hardEdge,
                          margin: EdgeInsets.only(top: defaultPadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: secondaryColor,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: -2,
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 5),
                              ),
                            ],
                            border: Border.all(color: Colors.white),
                          ),
                          child: SwitchListTile(
                            contentPadding: EdgeInsets.only(left: 8),
                            activeColor: primaryColor,
                            value: controller.enabled.value,
                            onChanged: (value) {
                              controller.enabled.toggle();
                              controller.userCategory.enable = value;
                            },
                            title: Row(
                              children: [
                                Icon(
                                  controller.enabled.value
                                      ? LineIcons.check
                                      : Icons.close,
                                  color: controller.enabled.value
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                Expanded(
                                  child: Text(
                                    ' Disponible',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonCuston(
                                funtion: () {
                                  if (controller.formKey.currentState!
                                      .validate())
                                    return controller.editar.value
                                        ? controller.updateUserCategory()
                                        : controller.saveUserCategory();
                                },
                                icon: controller.editar.value
                                    ? Icon(Icons.edit)
                                    : Icon(Icons.add),
                                text: controller.editar.value
                                    ? "Editar"
                                    : "Guardar",
                              ),
                              if (controller.editar.value)
                                ButtonCuston(
                                  funtion: controller.limpiar,
                                  text: "Cancelar",
                                  bgcolor: Colors.red,
                                ),
                            ],
                          ))
                    ],
                  )
                : Container(
                    height: 300,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
