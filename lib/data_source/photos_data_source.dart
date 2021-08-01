
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:test_eclipse/models/photos_model.dart';

class PhotoDataSource {
  String url = 'https://jsonplaceholder.typicode.com/photos?albumId=';

  Future<List<Photo>> getPhotos(int albumId) async {
    Response response = await http.get(Uri.parse(url + albumId.toString()));

    return (jsonDecode(response.body) as List)
        .map((element) => Photo.fromJson(element))
        .toList();
  }
}