// Dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<dynamic>> getPictures(searchQuery) {
  String apiKey = DotEnv().env['PIXABAY_KEY'];
  final url =
      "https://pixabay.com/api/?key=$apiKey&q=$searchQuery&image_type=photo&pretty=true&per_page=200&page=1";

  return http.get(url).then((response) {
    Map body = jsonDecode(response.body);
    List<dynamic> hits = body["hits"];
    return hits;
  });
}
