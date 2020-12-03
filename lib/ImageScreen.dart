import 'package:flutter/material.dart';
import 'package:pixabay_flutter/OpacityImage.dart';

class ImageScreen extends StatelessWidget {
  // Declare a field that holds the image.
  final String url;

  // In the constructor, require an image.
  ImageScreen(this.url);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text(url),
        ),
        body: new Draggable(
            feedback: OpacityImage(url, 0.7),
            child: OpacityImage(url)));
  }
}
