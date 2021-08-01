
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_eclipse/bloc/comment_bloc/comment_bloc.dart';
import 'package:test_eclipse/models/posts_model.dart';
import 'package:test_eclipse/views/posts_screen/add_comment_screen.dart';
import 'package:test_eclipse/widgets/comment_card.dart';
import 'package:test_eclipse/widgets/gradient_app_bar.dart';

class SinglePostScreen extends StatelessWidget {
  final Post post;
  const SinglePostScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommentBloc()..add(GetCommentsEvent(post.id)),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(title: post.title),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Center(
                    child: Text(
                      post.title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),

                  subtitle: Text(
                    post.body,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  if (state is CommentLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CommentFailure) {
                    return Text(state.error);
                  } else if (state is CommentSuccess) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: state.comments.length,
                            itemBuilder: (context, index) {
                              return CommentCard(
                                comment: state.comments[index],
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Color(0xff6C63FF),
                            height: 50,
                            width: double.maxFinite,
                            child: FlatButton(
                              height: MediaQuery.of(context).size.height,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddCommentScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Add comment',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else
                    return Offstage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}