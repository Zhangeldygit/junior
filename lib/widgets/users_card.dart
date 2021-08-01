

import 'package:flutter/material.dart';
import 'package:test_eclipse/models/users_model.dart';
import 'package:test_eclipse/views/user_screen/user_detail_screen.dart';

class UsersCard extends StatelessWidget {
  final User user;
  const UsersCard({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 10),
      decoration: BoxDecoration(color: Color(0xff221C44)),
      child: ListTile(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    DetailsScreen(user: user),
              ));
        },
        title: Text(user.username, overflow: TextOverflow.ellipsis, style: TextStyle(
            color: Colors.white, fontFamily: 'Raleway', fontSize: 20
        ),),
        subtitle: Text(user.name, overflow: TextOverflow.ellipsis, style: TextStyle(
            color: Colors.grey, fontFamily: 'Raleway', fontSize: 20
        ),),
      ),
    );
  }
}