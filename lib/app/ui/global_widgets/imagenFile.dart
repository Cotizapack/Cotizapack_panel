import 'dart:typed_data';

import 'package:cotizaweb/app/data/provider/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagenFile extends GetView {
  final String idImagen;
  final double width;
  final double height;
  final double circular;

  ImagenFile(
      {required this.idImagen,
      this.width = 80,
      this.height = 80,
      this.circular = 15});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(circular),
      ),
      child: FutureBuilder<Uint8List?>(
        future: MyStorage().getFilePreview(
          fileId: idImagen,
        ), //works for both public file and private file, for private files you need to be logged in
        builder: (context, data) {
          return data.hasError
              ? Icon(
                  Icons.error,
                  color: Colors.red,
                )
              : data.hasData && data.data != null
                  ? Image.memory(
                      data.data!,
                      fit: BoxFit.fill,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
        },
      ),
    );
  }
}
