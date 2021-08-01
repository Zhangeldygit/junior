part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<User> users;

  UserSuccess(this.users);

}

class UserFailure extends UserState {
  final String errorUser;
  UserFailure(this.errorUser);

  @override
  String toString() => errorUser;

}