import 'package:bloc/bloc.dart';
import 'package:http_with_bloc/bloc/user_event.dart';
import 'package:http_with_bloc/bloc/user_state.dart';
import 'package:http_with_bloc/services/user_provider.dart';

import '../model/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(EmptyUserState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(LoadingUserState());
      try {
        final List<User> loadedUserlist = await userRepository.getAllUsers();
        emit(LoadedUserState(loadedUser: loadedUserlist));
      } catch (e) {
        emit(ErrorUserState());
      }
    });
    on<UserClearEvent>((event, emit) async {
      emit(EmptyUserState());
    });
  }
}
