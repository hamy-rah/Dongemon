// user_event.dart

abstract class UserEvent {}

class AddUser extends UserEvent {
  final String name;


  AddUser({required this.name});
}
// در user_event.dart

class RemoveUser extends UserEvent {
  final int index;

  RemoveUser(this.index);
}
