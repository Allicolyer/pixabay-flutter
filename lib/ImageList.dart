import 'package:flutter/material.dart';
import 'package:pixabay_flutter/apiCall.dart';
import 'package:pixabay_flutter/ClickableImage.dart';
import 'package:pixabay_flutter/SearchTermPage.dart';
import 'package:pixabay_flutter/ImageScreen.dart';

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List<dynamic> _results;

  void initState() {
    this._fetchData();
  }

  void _fetchData() {
    final apiCall = new PictureApiCall();
    apiCall
        .getPictures()
        .then((body) => setState(() {
              _results = body;
            }))
        .catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

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

    return Scaffold(
        appBar: AppBar(
            title: Text("Pixabay Image Search"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchTermPage());
                },
                icon: Icon(Icons.search),
              )
            ]),
        body: new GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: children));
  }
}
