part of 'post_id_bloc.dart';

@immutable
abstract class PostIdEvent {}
class GetPostsByIdEvent extends PostIdEvent {
  final int userId;

  GetPostsByIdEvent(this.userId);
}