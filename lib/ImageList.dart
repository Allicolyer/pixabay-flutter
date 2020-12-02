import 'package:flutter/material.dart';
import 'package:pixabay_flutter/apiCall.dart';
import 'package:pixabay_flutter/ClickableImage.dart';
import 'package:pixabay_flutter/ImageScreen.dart';

class ImageList extends StatefulWidget {
  final String searchQuery;

  ImageList(this.searchQuery);

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  // variable to hold results
  List<dynamic> _results;

  // This is the first method called when the widget is created (after the class constructor). Fetch the data here.
  void initState() {
    this._fetchData();
  }

  // This is the first method called when the widget is created (after the class constructor). Fetch the data here.
  void didUpdateWidget(Widget _ImageListState) {
    this._fetchData();
  }

  void _fetchData() {
    getPictures(widget.searchQuery)
        .then((body) => setState(() {
              _results = body;
            }))
        .catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (_results != null) {
      _results.forEach((item) => {
            children.add(new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageScreen(item['previewURL']),
                    ),
                  );
                },
                child: ClickableImage(item['previewURL'])))
          });
    } else {
      children.add(new Text("Search for some images"));
    }
    return new GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: children);
  }
}
