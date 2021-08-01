

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_eclipse/bloc/user_bloc/user_bloc.dart';
import 'package:test_eclipse/widgets/gradient_app_bar.dart';
import 'package:test_eclipse/widgets/users_card.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc()..add(GetUsers()),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(isHided: true, title: 'Users'),
            UsersList()
          ],
        ),
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  const UsersList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state){
          if (state is UserLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserFailure){
            return Text(state.errorUser);
          }if (state is UserSuccess) {
            return ListView.separated(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                return UsersCard(
                  user: state.users[index],

                );
              },
            );
          } else {
            return Offstage();
          }
        },
      ),
    );
  }
}

