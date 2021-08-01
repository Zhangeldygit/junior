

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:test_eclipse/models/album_model.dart';

class AlbumIdDataSource {
  var url = 'https://jsonplaceholder.typicode.com/albums?userId=';

  Future<List<Album>> getAlbum(int userId) async {
    Response response = await http.get(Uri.parse(url + userId.toString()));

    return (jsonDecode(response.body) as List)
        .map((element) => Album.fromJson(element))
        .toList();
  }
}