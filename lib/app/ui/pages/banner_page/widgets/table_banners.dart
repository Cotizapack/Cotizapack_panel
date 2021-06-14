import 'package:cotizaweb/app/data/models/banner_model.dart';
import 'package:cotizaweb/app/ui/global_widgets/imagenFile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TableBanners extends GetView {
  final List<BannerModel> data;
  final bool? movil;
  const TableBanners({
    Key? key,
    required this.data,
    this.movil = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text("Imagen"),
            ),
            DataColumn(
              label: Text("Titulo"),
            ),
            if (!movil!)
              DataColumn(
                label: Text("Descripción"),
              ),
            DataColumn(
              label: Text("Creado"),
            ),
            DataColumn(
              label: Text("Acciones"),
            ),
          ],
          rows: List.generate(data.length, (index) => bannerRow(data[index])),
        ),
      ),
    );
  }

  DataRow bannerRow(BannerModel banner) {
    return DataRow(
      cells: [
        DataCell(Center(child: ImagenFile(idImagen: banner.image!))),
        DataCell(Text(banner.title!)),
        if (!movil!) DataCell(Text(banner.description!)),
        DataCell(Text(
          '${DateFormat.yMd('es_US').format(DateTime.fromMillisecondsSinceEpoch(banner.createAt!))}',
        )),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        )),
      ],
    );
  }
}