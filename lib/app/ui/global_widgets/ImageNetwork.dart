import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageNetworkPage extends GetView {
  final String url;

  ImageNetworkPage({required this.url});

  @override
  Widget build(BuildContext context) {
    String imageUrl = url;
    // https://github.com/flutter/flutter/issues/41563
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int _) => ImageElement()..src = imageUrl,
    );
    return HtmlElementView(
      viewType: imageUrl,
    );
  }
}
