import 'package:cotizaweb/app/controllers/dashboard_controller.dart';
import 'package:cotizaweb/app/data/models/PackageModel.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class RecentFiles extends GetView<DashboardController> {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ventas Recientes",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: Obx(
              () => DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                    label: Text("Paquete"),
                  ),
                  DataColumn(
                    label: Text("Precio"),
                  ),
                  DataColumn(
                    label: Text("Cotizaciones"),
                  ),
                ],
                rows: List.generate(
                  controller.globalController.package.length,
                  (index) => recentFileDataRow(
                      controller.globalController.package[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(Packageclass package) {
  return DataRow(
    cells: [
      DataCell(Text(package.name!)),
      DataCell(Text(package.price!.toDouble().toStringAsFixed(2))),
      DataCell(Text(package.quotations!.toString())),
    ],
  );
}
