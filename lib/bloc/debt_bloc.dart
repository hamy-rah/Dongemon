import 'package:flutter_bloc/flutter_bloc.dart';

class Debt {
  final String name;
  final double amount;

  Debt(this.name, this.amount);
}

class DebtEvent {
  final List<Debt> debts;

  DebtEvent(this.debts);
}

class DebtBloc extends Bloc<DebtEvent, List<Debt>> {
  DebtBloc() : super([]) {
    on<DebtEvent>((event, emit) => emit(event.debts));
  }
}