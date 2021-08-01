part of 'post_id_bloc.dart';

@immutable
abstract class PostIdState {}

class PostIdInitial extends PostIdState {
  final List<Post> postId = const [];
}

class PostIdLoading extends PostIdState {}

class PostIdSuccess extends PostIdState {
  final List<Post> postId;

  PostIdSuccess(this.postId);
}

class PostIdFailure extends PostIdState {
  final String error;

  PostIdFailure(this.error);

  @override
  String toString() => error;
}
