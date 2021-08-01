import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_eclipse/models/users_model.dart';

class UsersDataSource {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<User>> getUsers() async {
    Response response = await get(url);

    return (jsonDecode(response.body) as List)
        .map((element) => User.fromJson(element))
        .toList();
  }
}