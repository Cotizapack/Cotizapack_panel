import 'package:cotizaweb/app/controllers/banner_controller.dart';
import 'package:cotizaweb/app/data/common/validators.dart';
import 'package:cotizaweb/app/ui/global_widgets/border.dart';
import 'package:cotizaweb/app/ui/global_widgets/button.dart';
import 'package:cotizaweb/app/ui/global_widgets/textfild.dart';
import 'package:cotizaweb/app/ui/pages/banner_page/widgets/dropzone.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FormUploadBanner extends GetView<BannerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(
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
                ),
              ),
            ),
            !controller.sendData.value
                ? Column(
                    children: [
                      InputText(
                        name: 'Titulo',
                        controller: controller.titleController,
                        textInputType: TextInputType.name,
                        validator: Validators.nameValidator,
                        prefixIcon: Icon(LineIcons.edit),
                        onChanged: (val) => controller.banner.title = val,
                      ),
                      InputText(
                        name: 'Descripcion',
                        controller: controller.descriptionController,
                        textInputType: TextInputType.name,
                        validator: Validators.nameValidator,
                        prefixIcon: Icon(LineIcons.editAlt),
                        onChanged: (val) => controller.banner.description = val,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: defaultPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: primaryColor.withOpacity(0.15),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(defaultPadding),
                          ),
                        ),
                        child: SfDateRangePicker(
                          controller: controller.dateTimeController,
                          initialSelectedRange: PickerDateRange(
                            DateTime.now(),
                            DateTime.now().add(
                              const Duration(days: 3),
                            ),
                          ),
                          minDate: DateTime.now(),
                          maxDate: DateTime.now().add(
                            const Duration(days: 60),
                          ),
                          onSelectionChanged: controller.onSelectionChanged,
                          selectionMode: DateRangePickerSelectionMode.range,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonCuston(
                            funtion: () {
                              if (controller.formKey.currentState!.validate())
                                return controller.editar
                                    ? controller.updateMyBanner()
                                    : controller.saveMyBanner();
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
