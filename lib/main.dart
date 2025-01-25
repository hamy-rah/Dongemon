import 'package:dongemon/homepage.dart';
import 'package:dongemon/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/debt_bloc.dart';
import 'bloc/expense_bloc.dart';
void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => ExpenseBloc()),
        BlocProvider(create: (_) => DebtBloc()),
      ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
}