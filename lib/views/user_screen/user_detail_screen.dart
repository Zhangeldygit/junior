import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_eclipse/bloc/album_by_id_bloc/album_id_bloc.dart';
import 'package:test_eclipse/bloc/post_by_id_bloc/post_id_bloc.dart';
import 'package:test_eclipse/models/users_model.dart';
import 'package:test_eclipse/views/photos_screen/photos_screen.dart';
import 'package:test_eclipse/widgets/gradient_app_bar.dart';
import 'package:test_eclipse/widgets/post_card.dart';

class DetailsScreen extends StatelessWidget {
  final User user;
  const DetailsScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PostIdBloc()..add(GetPostsByIdEvent(user.id)),
        ),
        BlocProvider(create: (_) => AlbumIdBloc()..add(GetAlbumId(user.id)))
      ],
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(title: user.username),
            userInfo(context),
            Expanded(
              child: BlocBuilder<PostIdBloc, PostIdState>(
                builder: (context, state) {
                  if (state is PostIdLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PostIdFailure) {
                    return Text(state.error);
                  }
                  if (state is PostIdSuccess) {
                    return ListView.separated(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: state.postId.length,
                      itemBuilder: (context, index) {
                        return PostCard(post: state.postId[index]);
                      },
                    );
                  } else
                    return Offstage();
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<AlbumIdBloc, AlbumIdState>(
                builder: (context, state) {
                  if (state is AlbumIdLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AlbumIdFailure) {
                    return Text(state.message);
                  }
                  if (state is AlbumIdSuccess) {
                    return ListView.separated(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: state.albums.length,
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
                            width: 150,
                            height: 150,
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
                    );
                  } else
                    return Offstage();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget userInfo(BuildContext context) {
    final TextEditingController _nameController =
    TextEditingController(text: user.name);
    final TextEditingController _emailController =
    TextEditingController(text: user.email);
    final TextEditingController _phoneController =
    TextEditingController(text: user.phone);
    final TextEditingController _websiteController =
    TextEditingController(text: user.website);
    final TextEditingController _companyController =
    TextEditingController(text: user.companyName);
    final TextEditingController _addressController = TextEditingController(
        text: user.addressStreet + " " + user.addressSuite);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        TextField(
          enabled: false,
          readOnly: true,
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(3)),
              contentPadding: EdgeInsets.all(16),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white)),
          style: TextStyle(
            color: Colors.white,
          ),
          controller: _nameController,
        ),
        SizedBox(height: 10),
        TextField(
          enabled: false,
          readOnly: true,
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(3)),
              contentPadding: EdgeInsets.all(16),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white)),
          style: TextStyle(
            color: Colors.white,
          ),
          controller: _emailController,
        ),
        SizedBox(height: 20),
        TextField(
          enabled: false,
          readOnly: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(4)),
              contentPadding: EdgeInsets.all(16),
              labelText: 'Phone number',
              labelStyle: TextStyle(color: Colors.white)),
          controller: _phoneController,
        ),
        SizedBox(height: 20),
        TextField(
          enabled: false,
          readOnly: true,
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(4)),
              contentPadding: EdgeInsets.all(16),
              labelText: 'Website',
              labelStyle: TextStyle(color: Colors.white)),
          style: TextStyle(color: Colors.white),
          controller: _websiteController,
        ),
        SizedBox(height: 20),
        TextField(
          enabled: false,
          readOnly: true,
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(4)),
              contentPadding: EdgeInsets.all(16),
              labelText: 'Company',
              labelStyle: TextStyle(color: Colors.white)),
          style: TextStyle(color: Colors.white),
          controller: _companyController,
        ),
        Padding(
          padding: EdgeInsets.all(8), child:
          ListTile(
            title: Text(user.companyBs, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            subtitle: Text(user.companyCatchPhrase, style: TextStyle(color: Colors.grey),),
          ),),
        SizedBox(height: 20),
        TextField(
          enabled: false,
          readOnly: true,
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(4)),
              contentPadding: EdgeInsets.all(16),
              labelText: 'Address',
              labelStyle: TextStyle(color: Colors.white)),
          style: TextStyle(color: Colors.white),
          controller: _addressController,
        ),
      ],
    );
  }
}


