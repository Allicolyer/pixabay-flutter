// Dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PictureApiCall {
  String apiKey = DotEnv().env['PIXABAY_KEY'];

  Future<List<dynamic>> getPictures() {
    final url =
        "https://pixabay.com/api/?key=$apiKey&q=bird&image_type=photo&pretty=true&per_page=200&page=1";
    return http.get(url).then((response) {
      Map body = jsonDecode(response.body);
      List<dynamic> hits = body["hits"];
      return hits;
    });
  }
}
