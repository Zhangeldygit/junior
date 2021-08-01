


import 'package:flutter/material.dart';
import 'package:test_eclipse/models/posts_model.dart';
import 'package:test_eclipse/views/posts_screen/single_post_screen.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 10),
      decoration: BoxDecoration(color: Color(0xff221C44)),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SinglePostScreen(
                  post: post,
                )),
          );
        },
        contentPadding: EdgeInsets.all(16),
        title: Text(
          post.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          post.body,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}