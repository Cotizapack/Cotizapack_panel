import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Calendar extends GetView {
  final DateRangePickerController? controller;
  final DateRangePickerSelectionMode? selectionMode;
  final Function(DateRangePickerSelectionChangedArgs)? onSelectionChanged;
  final DateTime? minDate;
  final DateTime? maxDate;
  final PickerDateRange? initialSelectedRange;

  Calendar(
      {this.controller,
      this.selectionMode,
      this.onSelectionChanged,
      this.minDate,
      this.maxDate,
      this.initialSelectedRange});
  @override
  Widget build(BuildContext context) {
    return Container(
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
        controller: controller,
        initialSelectedRange: initialSelectedRange,
        minDate: minDate,
        maxDate: maxDate,
        onSelectionChanged: onSelectionChanged,
        selectionMode: selectionMode ?? DateRangePickerSelectionMode.single,
      ),
    );
  }
}
