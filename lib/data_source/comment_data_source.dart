import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:test_eclipse/models/comment_model.dart';

class CommentDataSource {
  String url = 'https://jsonplaceholder.typicode.com/comments?postId=';

  Future<List<Comment>> getComments(int postId) async {
    Response response = await http.get(Uri.parse(url + postId.toString()));

    return (jsonDecode(response.body) as List)
        .map((element) => Comment.fromJson(element))
        .toList();
  }
}