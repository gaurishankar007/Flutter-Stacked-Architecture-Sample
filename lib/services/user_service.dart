import '../ui/view/login/user_model.dart';

class UserService {
  final List<UserModel> registeredUsers = [];
  UserModel? currentUser;

  registerUser(UserModel user) => registeredUsers.add(user);
  setCurrentUser(UserModel user) => currentUser = user;
}
