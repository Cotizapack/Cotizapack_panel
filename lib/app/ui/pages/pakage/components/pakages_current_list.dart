import 'package:cotizaweb/app/controllers/pakage_controller.dart';
import 'package:cotizaweb/app/data/models/PakageModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TablePakages extends GetView<PakagesController> {
  final List<Pakageclass> data;
  final bool? movil;
  const TablePakages({
    Key? key,
    required this.data,
    this.movil = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(
              label: Text("Nombre"),
            ),
            if (!movil!)
              DataColumn(
                label: Text("Description"),
              ),
            DataColumn(
              label: Text("Cotizaciones"),
            ),
            DataColumn(
              label: Text("Descuento"),
            ),
            DataColumn(
              label: Text("Creado"),
            ),
            DataColumn(
              label: Text("Acciones"),
            ),
          ],
          rows: List.generate(data.length, (index) => pakageRow(data[index])),
        ),
      ),
    );
  }

  DataRow pakageRow(Pakageclass pakage) {
    return DataRow(
      cells: [
        DataCell(Text(pakage.name!)),
        if (!movil!)
          DataCell(
            Text(pakage.description!),
          ),
        DataCell(Text('${pakage.quotations}')),
        DataCell(Text('${pakage.percentage}')),
        DataCell(
          Text(
            '${DateFormat.yMd('es_US').format(DateTime.fromMillisecondsSinceEpoch(pakage.createAt!))}',
          ),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: () => controller.setdataEdit(pakage),
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () => controller.deletePakage(pakage),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
