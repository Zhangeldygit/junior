

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_eclipse/bloc/post_bloc/post_bloc.dart';
import 'package:test_eclipse/models/posts_model.dart';
import 'package:test_eclipse/widgets/gradient_app_bar.dart';
import 'package:test_eclipse/widgets/post_card.dart';

class PostsScreen extends StatelessWidget {
  final Post post;
  const PostsScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc()..add(GetPosts()),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(
              title: "Posts",
              isHided: true,
            ),
            PostsList(),
          ],
        ),
      ),
    );
  }
}

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostFailure) {
            return Text(state.errorMessage);
          }
          if (state is PostSuccess) {
            return ListView.separated(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: state.posts[index]);
              },
            );
          } else
            return Offstage();
        },
      ),
    );
  }
}