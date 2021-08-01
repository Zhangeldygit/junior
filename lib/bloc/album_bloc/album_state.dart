part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {
  final List<Album> albums = const [];
}

class AlbumLoading extends AlbumState {}

class AlbumSuccess extends AlbumState {
  final List<Album> albums;

  AlbumSuccess(this.albums);
}

class AlbumFailure extends AlbumState {
  final String message;

  AlbumFailure(this.message);

  @override
  String toString() => message;
}