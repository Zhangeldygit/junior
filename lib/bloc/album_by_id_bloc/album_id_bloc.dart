import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_eclipse/data_source/album_id_data_source.dart';
import 'package:test_eclipse/data_source/photos_data_source.dart';
import 'package:test_eclipse/models/album_model.dart';
import 'package:test_eclipse/models/photos_model.dart';

part 'album_id_event.dart';
part 'album_id_state.dart';


class AlbumIdBloc extends Bloc<AlbumIdEvent, AlbumIdState> {
  AlbumIdBloc() : super(AlbumIdInitial());
  AlbumIdDataSource _albumIdDataSource = AlbumIdDataSource();
  PhotoDataSource _photoDataSource = PhotoDataSource();

  @override
  Stream<AlbumIdState> mapEventToState(
      AlbumIdEvent event,
      ) async* {
    if (event is GetAlbumId) {
      yield AlbumIdLoading();
      try {
        final List<Album> albums = await _albumIdDataSource.getAlbum(event.userId);
        for (final Album album in albums) {
          final List<Photo> photos = await _photoDataSource.getPhotos(album.id);

          album.images = photos;
        }
        yield AlbumIdSuccess(albums);
      } on Exception catch (e) {
        yield AlbumIdFailure(e.toString());
      }
    }
  }
}

