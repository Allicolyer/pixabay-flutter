import 'package:flutter/material.dart';

class ClickableImage extends StatefulWidget {
  final String url;

  ClickableImage(this.url);

  @override
  _ClickableImageState createState() => _ClickableImageState();
}

class _ClickableImageState extends State<ClickableImage> {
  double imageOpacity = 1.0;

  void darken() {
    setState(() {
      imageOpacity = 0.7;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: imageOpacity, child: Image(image: NetworkImage(widget.url)));
  }
}
