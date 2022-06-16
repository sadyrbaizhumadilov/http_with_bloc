import 'package:http_with_bloc/model/user_model.dart';

abstract class UserState {}

class EmptyUserState extends UserState {}

class LoadingUserState extends UserState {}

class LoadedUserState extends UserState {
  List<User> loadedUser;
  LoadedUserState({required this.loadedUser});
}

class ErrorUserState extends UserState {}
