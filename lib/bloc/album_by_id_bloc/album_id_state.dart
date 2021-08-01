part of 'album_id_bloc.dart';

@immutable
abstract class AlbumIdState {}

class AlbumIdInitial extends AlbumIdState {
  final List<Album> albums = const [];
}

class AlbumIdLoading extends AlbumIdState {}

class AlbumIdSuccess extends AlbumIdState {
  final List<Album> albums;

  AlbumIdSuccess(this.albums);
}

class AlbumIdFailure extends AlbumIdState {
  final String message;

  AlbumIdFailure(this.message);

  @override
  String toString() => message;
}