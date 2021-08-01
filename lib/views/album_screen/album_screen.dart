

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_eclipse/bloc/album_bloc/album_bloc.dart';
import 'package:test_eclipse/models/album_model.dart';
import 'package:test_eclipse/models/photos_model.dart';
import 'package:test_eclipse/views/photos_screen/photos_screen.dart';
import 'package:test_eclipse/widgets/gradient_app_bar.dart';

class AlbumsScreen extends StatelessWidget {
  final Album album;
  final Photo photo;
  const AlbumsScreen({Key key, this.album, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumBloc()..add(GetAlbum()),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(
              title: 'Album',
              isHided: true,
            ),
            AlbumList(),
          ],
        ),
      ),
    );
  }
}

class AlbumList extends StatelessWidget {
  const AlbumList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AlbumFailure) {
            return Text(state.message);
          }
          if (state is AlbumSuccess) {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhotosScreen(
                            album: state.albums[index],
                            photo: state.albums[index].images,
                          )),
                    );
                  },
                  child: Container(
                    child: Stack(
                      children: [
                        Image.network(
                          state.albums[index].images.first.thumbnailUrl,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(state.albums[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), maxLines: 1,),
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
            );
          } else
            return Offstage();
        },
      ),
    );
  }
}