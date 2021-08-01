import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_eclipse/data_source/post_id_data_source.dart';
import 'package:test_eclipse/models/posts_model.dart';

part 'post_id_event.dart';
part 'post_id_state.dart';

class PostIdBloc extends Bloc<PostIdEvent, PostIdState> {
  final PostIdDataSource _postIdDataSource = PostIdDataSource();
  PostIdBloc() : super(PostIdInitial());

  @override
  Stream<PostIdState> mapEventToState(
    PostIdEvent event,
  ) async* {
    if(event is GetPostsByIdEvent){
      yield PostIdLoading();
      try {
        final List<Post> postId =
        await _postIdDataSource.getPostsById(event.userId);
        yield PostIdSuccess(postId);
      } on Exception catch (e) {
        yield PostIdFailure(e.toString());
      }
    }
  }
}
