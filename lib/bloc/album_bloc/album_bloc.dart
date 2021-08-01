import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_eclipse/data_source/album_data_source.dart';
import 'package:test_eclipse/data_source/photos_data_source.dart';
import 'package:test_eclipse/models/album_model.dart';
import 'package:test_eclipse/models/photos_model.dart';

part 'album_event.dart';
part 'album_state.dart';


class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitial());
  AlbumDataSource _albumDataSource = AlbumDataSource();
  PhotoDataSource _photoDataSource = PhotoDataSource();

  @override
  Stream<AlbumState> mapEventToState(
      AlbumEvent event,
      ) async* {
    if (event is GetAlbum) {
      yield AlbumLoading();
      try {
        final List<Album> albums = await _albumDataSource.getAlbum();
        for (final Album album in albums) {
          final List<Photo> photos = await _photoDataSource.getPhotos(album.id);

          album.images = photos;
        }
        yield AlbumSuccess(albums);
      } on Exception catch (e) {
        yield AlbumFailure(e.toString());
      }
    }
  }
}
