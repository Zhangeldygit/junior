import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_eclipse/data_source/comment_data_source.dart';
import 'package:test_eclipse/models/comment_model.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentDataSource commentDataSource = CommentDataSource();
  CommentBloc() : super(CommentInitial());

  @override
  Stream<CommentState> mapEventToState(
      CommentEvent event,
      ) async* {
    if (event is GetCommentsEvent) {
      yield CommentLoading();
      try {
        final List<Comment> comments =
        await commentDataSource.getComments(event.postId);
        yield CommentSuccess(comments);
      } on Exception catch (e) {
        yield CommentFailure(e.toString());
      }
    }
  }
}
