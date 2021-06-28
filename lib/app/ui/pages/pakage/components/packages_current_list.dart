import 'package:cotizaweb/app/controllers/Package_controller.dart';
import 'package:cotizaweb/app/data/models/PackageModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TablePackages extends GetView<PackagesController> {
  final List<Packageclass> data;
  final bool? movil;
  const TablePackages({
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
          columnSpacing: 10,
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
            if (!movil!)
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
          rows: List.generate(data.length, (index) => packageRow(data[index])),
        ),
      ),
    );
  }

  DataRow packageRow(Packageclass package) {
    return DataRow(
      cells: [
        DataCell(Text(package.name!)),
        if (!movil!) DataCell(Text(package.description!)),
        DataCell(Text('${package.quotations}')),
        if (!movil!) DataCell(Text('${package.percentage}')),
        DataCell(
          Text(
            '${DateFormat.yMd('es_US').format(DateTime.fromMillisecondsSinceEpoch(package.createAt!))}',
          ),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: () => controller.setdataEdit(package),
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () => controller.deletePackage(package),
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
