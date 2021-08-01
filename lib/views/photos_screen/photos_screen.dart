

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_eclipse/bloc/photos_bloc/photos_bloc.dart';
import 'package:test_eclipse/models/album_model.dart';
import 'package:test_eclipse/models/photos_model.dart';
import 'package:test_eclipse/widgets/gradient_app_bar.dart';

class PhotosScreen extends StatelessWidget {
  final Album album;
  final List<Photo> photo;
  const PhotosScreen({Key key, this.photo, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhotosBloc()..add(GetPhotos(album.id)),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(title: album.title),
            Expanded(
              child: GridView.builder(
                itemCount: photo.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    child: Stack(
                      children: [
                        Image.network(
                          photo[index].thumbnailUrl,
                          width: double.maxFinite,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(photo[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), maxLines: 1,),
                        ),
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}