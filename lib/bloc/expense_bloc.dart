import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseEvent {
  final double amount;
  final String? selectedGroup;

  ExpenseEvent({required this.amount, this.selectedGroup});
}

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseEvent> {
  ExpenseBloc() : super(ExpenseEvent(amount: 0.0, selectedGroup: null)) {
    on<ExpenseEvent>((event, emit) => emit(event));
  }
}