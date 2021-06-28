import 'package:cotizaweb/app/controllers/Package_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagakeCard extends GetView<PackagesController> {
  const PagakeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white10,
      child: ListTile(
        title: Row(
          children: [
            Text(
              'Titulo',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Fecha de expiración',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
        subtitle: Text(
          'Decripción',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
