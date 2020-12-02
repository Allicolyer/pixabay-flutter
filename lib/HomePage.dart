import 'package:flutter/material.dart';
import 'package:pixabay_flutter/ImageList.dart';
import 'package:pixabay_flutter/ImageSearchDelegate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery;

  void setNewSearchQuery(query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
            title: Text("Pixabay Image Search"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                onPressed: () async {
                  setNewSearchQuery(await showSearch(
                    context: context,
                    delegate: ImageSearchDelegate(),
                  ));
                },
                icon: Icon(Icons.search),
              )
            ]),
        body: new ImageList(searchQuery));
  }
}
