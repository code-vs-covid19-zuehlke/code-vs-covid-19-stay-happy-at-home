import 'models/User.dart';

class UserState {
  static final UserState _instance = UserState._internal();

  factory UserState() => _instance;
  User user;

  UserState._internal() {
    // init things inside this
  }

// Methods, variables ...
}
