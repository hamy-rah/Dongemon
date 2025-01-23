// user_state.dart

import 'user.dart';

abstract class UserState {
  final List<User> users;

  UserState(this.users);
}

class UserInitial extends UserState {
  UserInitial() : super([]);
}

class UserLoaded extends UserState {
  UserLoaded(List<User> users) : super(users);
}
