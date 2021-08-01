import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_eclipse/data_source/post_id_data_source.dart';
import 'package:test_eclipse/data_source/users_data_source.dart';
import 'package:test_eclipse/models/users_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  UsersDataSource _usersDataSource = UsersDataSource();
  PostIdDataSource _postIdDataSource = PostIdDataSource();


  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUsers) {
      yield UserLoading();
      try {
        final List<User> users = await _usersDataSource.getUsers();
        yield UserSuccess(users);
      } on Exception catch (e) {
        yield UserFailure(e.toString());
      }
    }
  }
}
