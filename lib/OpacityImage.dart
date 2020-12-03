import 'package:flutter/material.dart';

class OpacityImage extends StatelessWidget {
  final String url;
  final double imageOpacity;

  // the image opacity is optional
  OpacityImage(this.url, [this.imageOpacity]);

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: this.imageOpacity ?? 1.0,
        child: Image(image: NetworkImage(this.url)));
  }
}
