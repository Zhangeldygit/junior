import 'package:flutter/material.dart';
import 'package:test_eclipse/models/comment_model.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  const CommentCard({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0xff221C44)),
            margin: EdgeInsets.only(top: 10, left: 16, right: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: SizedBox(
                width: 250,
                child: Text(
                  comment.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  comment.body,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}