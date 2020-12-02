import 'package:flutter/material.dart';

class ImageSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // erases query when closed is pressed
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            showResults(context);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // sends the user back to the previous page
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult;

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Text(query);
  }

  List<String> recentList = ["Birds", "Owls"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    suggestionList = recentList;

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
            // return with the context
            close(context, query);
          },
        );
      },
    );
  }
}

// source https://github.com/luizeduardotj/searchbarflutterexample/blob/master/lib/pages/home_page.dart
