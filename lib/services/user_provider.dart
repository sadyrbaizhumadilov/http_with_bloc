import 'package:http_with_bloc/model/user_model.dart';
import 'package:http_with_bloc/services/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}
