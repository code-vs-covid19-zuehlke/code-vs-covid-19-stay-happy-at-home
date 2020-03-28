class UserState {
  static final UserState _instance = UserState._internal();

  factory UserState() => _instance;
  String username;
  String userId;

  UserState._internal() {
    // init things inside this
  }

// Methods, variables ...
}
