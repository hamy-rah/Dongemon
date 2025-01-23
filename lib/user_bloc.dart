// user_bloc.dart

import 'package:bloc/bloc.dart';
import 'user_event.dart';
import 'user_state.dart';
import 'user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<AddUser>((event, emit) {
      final updatedUsers = List<User>.from(state.users)
        ..add(User(name: event.name));
      emit(UserLoaded(updatedUsers));
    });
    // در user_bloc.dart

    on<RemoveUser>((event, emit) {
      final updatedUsers = List<User>.from(state.users)..removeAt(event.index);
      emit(UserLoaded(updatedUsers));
    });

  }
}

