import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<SearchTextField> {
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(children: [Expanded(child: TextField())]);
  }
}
