import 'package:cotizaweb/app/data/models/MyFiles.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final ClouddataInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 24, color: info.color),
          ),
          Expanded(
            child: FittedBox(
              child: Text(
                '${info.numOfFiels!}',
                style: TextStyle(color: info.color),
              ),
            ),
          )
        ],
      ),
    );
  }
}
