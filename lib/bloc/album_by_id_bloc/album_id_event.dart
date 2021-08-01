part of 'album_id_bloc.dart';

@immutable
abstract class AlbumIdEvent {}
class GetAlbumId extends AlbumIdEvent {
  final int userId;

  GetAlbumId(this.userId);
}