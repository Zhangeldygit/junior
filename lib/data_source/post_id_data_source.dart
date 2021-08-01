import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:test_eclipse/models/posts_model.dart';

class PostIdDataSource {
  String url = 'https://jsonplaceholder.typicode.com/posts?userId=';

  Future<List<Post>> getPostsById(int userId) async {
    Response response = await http.get(Uri.parse(url + userId.toString()));

    return (jsonDecode(response.body) as List)
        .map((element) => Post.fromJson(element))
        .toList();
  }
}