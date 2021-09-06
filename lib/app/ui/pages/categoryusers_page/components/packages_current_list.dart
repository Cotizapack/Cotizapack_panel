import 'package:cotizaweb/app/controllers/categoryusers_controller.dart';
import 'package:cotizaweb/app/data/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableCategory extends GetView<CategoryUsersController> {
  final List<UserCategory> data;
  final bool? movil;
  const TableCategory({
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
              label: Text("Acciones"),
            ),
          ],
          rows: List.generate(data.length, (index) => packageRow(data[index])),
        ),
      ),
    );
  }

  DataRow packageRow(UserCategory usercategory) {
    return DataRow(
      cells: [
        DataCell(Text(usercategory.name!)),
        if (!movil!) DataCell(Text(usercategory.description!)),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: () => controller.setdataEdit(usercategory),
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () => controller.deletePackage(usercategory),
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
