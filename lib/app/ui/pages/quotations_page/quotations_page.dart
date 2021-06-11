
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/quotations_controller.dart';


class QuotationsPage extends GetView<QuotationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuotationsPage'),
      ),
      body: SafeArea(
        child: Text('QuotationsController'),
      ),
    );
  }
}
  