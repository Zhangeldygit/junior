part of 'post_bloc.dart';

@immutable
abstract class PostState {}


class PostInitial extends PostState {
  final List<Post> posts = const [];
}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final List<Post> posts;

  PostSuccess(this.posts);
}

class PostFailure extends PostState {
  final String errorMessage;

  PostFailure(this.errorMessage);

  @override
  String toString() => errorMessage;
}
