import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_eclipse/data_source/post_id_data_source.dart';
import 'package:test_eclipse/data_source/posts_data_source.dart';
import 'package:test_eclipse/models/posts_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());
  PostsDataSource _postsDataSource = PostsDataSource();

  // PostIdDataSource _postIdDataSource = PostIdDataSource();

  @override
  Stream<PostState> mapEventToState(
      PostEvent event,
      ) async* {
    if (event is GetPosts) {
      try {
        List<Post> posts = await _postsDataSource.getPosts();
        yield PostSuccess(posts);
      } on Exception catch (e) {
        yield PostFailure(e.toString());
      }
    }
  }
}
