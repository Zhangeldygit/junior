import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:test_eclipse/models/album_model.dart';

class AlbumDataSource {
  var url = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<Album>> getAlbum() async {
    Response response = await http.get(Uri.parse(url));

    return (jsonDecode(response.body) as List)
        .map((element) => Album.fromJson(element))
        .toList();
  }
}