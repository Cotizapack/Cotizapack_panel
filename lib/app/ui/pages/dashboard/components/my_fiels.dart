import 'package:cotizaweb/app/data/models/MyFiles.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'file_info_card.dart';

class MyFiels extends GetResponsiveView {
  @override
  Widget? phone() {
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        FileInfoCardGridView(
          crossAxisCount: screen.width < 900 ? 2 : 4,
          childAspectRatio: screen.width < 900 ? 1.3 : 1,
        ),
      ],
    );
  }

  @override
  Widget? tablet() {
    return Column(
      children: [SizedBox(height: defaultPadding), FileInfoCardGridView()],
    );
  }

  @override
  Widget? desktop() {
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        FileInfoCardGridView(
          childAspectRatio: screen.width < 1200 ? 1.1 : 1.4,
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends GetView {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiels[index]),
    );
  }
}
