import 'package:cotizaweb/app/controllers/pakage_controller.dart';
import 'package:cotizaweb/app/data/common/validators.dart';
import 'package:cotizaweb/app/ui/global_widgets/border.dart';
import 'package:cotizaweb/app/ui/global_widgets/button.dart';
import 'package:cotizaweb/app/ui/global_widgets/calendar.dart';
import 'package:cotizaweb/app/ui/global_widgets/textfild.dart';
import 'package:cotizaweb/app/ui/pages/banner_page/widgets/dropzone.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PakageForm extends GetView<PakagesController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PakagesController>(
      id: "formUpload",
      builder: (_) => Form(
        key: controller.formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: Text(
                'Agregar Banner',
                style: Get.theme.textTheme.headline6,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 160,
              child: Obx(
                () => controller.imagenUploaded.value.isEmpty
                    ? Container(
                        child: buildBorder(
                          child: Center(
                            child: Icon(
                              Icons.add_a_photo_outlined,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        child: Image.memory(controller.imagenUploaded.value),
                      ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: defaultPadding),
                child: DropZoneWidget(
                  height: 160,
                  controller: controller,
                ),
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
                        onChanged: (val) => controller.pakages.name = val,
                      ),
                      InputText(
                        name: 'Descripcion',
                        controller: controller.descriptionController,
                        textInputType: TextInputType.name,
                        validator: Validators.nameValidator,
                        prefixIcon: Icon(LineIcons.editAlt),
                        onChanged: (val) =>
                            controller.pakages.description = val,
                      ),
                      InputText(
                        name: 'Cantidad Cotizaciones',
                        controller: controller.quantityController,
                        textInputType: TextInputType.number,
                        validator: Validators.numberValidator,
                        prefixIcon: Icon(LineIcons.sortNumericDown),
                        onChanged: (val) =>
                            controller.pakages.quotations = int.parse(val),
                      ),
                      InputText(
                        name: 'Precio',
                        controller: controller.priceController,
                        textInputType: TextInputType.number,
                        validator: Validators.numberValidator,
                        prefixIcon: Icon(LineIcons.sortNumericDown),
                        onChanged: (val) =>
                            controller.pakages.price = int.parse(val),
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
                            value: controller.onsale.value,
                            onChanged: (value) => controller.onsale.toggle(),
                            title: Row(
                              children: [
                                Icon(LineIcons.gift),
                                Text(' En Promocion')
                              ],
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.onsale.value
                            ? InputText(
                                name: 'Porcentaje de descuento',
                                controller: controller.percentageController,
                                textInputType: TextInputType.number,
                                validator: Validators.numberValidator,
                                prefixIcon: Icon(LineIcons.sortNumericDown),
                                onChanged: (val) => controller
                                    .pakages.percentage = int.parse(val),
                              )
                            : Container(),
                      ),
                      Calendar(
                        controller: null,
                        initialSelectedRange: PickerDateRange(
                          DateTime.now(),
                          DateTime.now().add(
                            const Duration(days: 3),
                          ),
                        ),
                        maxDate: DateTime.now().add(Duration(days: 60)),
                        onSelectionChanged: null,
                        selectionMode: DateRangePickerSelectionMode.range,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonCuston(
                            funtion: () {
                              if (controller.formKey.currentState!.validate())
                                return controller.editar
                                    ? controller.updateMyPakage()
                                    : controller.saveMyPakage();
                            },
                            icon: controller.editar
                                ? Icon(Icons.edit)
                                : Icon(Icons.add),
                            text: controller.editar ? "Editar" : "Guardar",
                          ),
                          if (controller.editar)
                            ButtonCuston(
                              funtion: controller.limpiar,
                              text: "Cancelar",
                              bgcolor: Colors.red,
                            ),
                        ],
                      )
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
