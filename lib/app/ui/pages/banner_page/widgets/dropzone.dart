import 'package:cotizaweb/app/controllers/banner_controller.dart';
import 'package:cotizaweb/app/ui/global_widgets/border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class DropZoneWidget extends GetView<BannerController> {
  final double? height, width;

  DropZoneWidget({this.height = 0, this.width = double.infinity});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: height,
        decoration: BoxDecoration(
          color: controller.hoverFile.value ? Colors.green : Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            DropzoneView(
              onDrop: controller.acceptFile,
              operation: DragOperation.all,
              onCreated: (controFile) {
                controller.controllerFile = controFile;
              },
              onHover: () => controller.hoverFile.value = true,
              onError: (ev) => print('Archivo no permitido'),
              onLoaded: () => print('Cargando...'),
              onLeave: () => controller.hoverFile.value = false,
              cursor: CursorType.pointer,
            ),
            buildBorder(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.drive_folder_upload_outlined),
                    ElevatedButton.icon(
                      onPressed: controller.searchFile,
                      icon: Icon(Icons.add_a_photo),
                      label: Text('Agregar Foto'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          controller.hoverFile.value
                              ? Colors.green
                              : Colors.blue,
                        ),
                      ),
                    ),
                    Text('Arraste una imagen')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
