import 'package:dongemon/Home.dart';
import 'package:dongemon/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_expenses.dart';
import 'bloc/debt_bloc.dart';
import 'bloc/expense_bloc.dart';

class Choosing extends StatefulWidget {
  const Choosing({super.key});

  @override
  State<Choosing> createState() => _ChoosingState();
}

class _ChoosingState extends State<Choosing> {
  String? _selectedPayer;
  final Set<String> _selectedPayees = {};

  void _handlePayerSelected(String payer) => setState(() => _selectedPayer = payer);

  void _handlePayeeSelected(String payee) => setState(() {
    _selectedPayees.contains(payee)
        ? _selectedPayees.remove(payee)
        : _selectedPayees.add(payee);
  });

  void _confirm() {
    final filteredPayees = _selectedPayees.where((p) => p != "حامد").toList();
    if (filteredPayees.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('حداقل یک نفر باید انتخاب شود (به غیر از حامد)')));
      return;
    }

    final expenseBloc = BlocProvider.of<ExpenseBloc>(context);
    final totalAmount = expenseBloc.state.amount;
    final share = totalAmount / filteredPayees.length;

    final debts = filteredPayees.map((p) => Debt(p, share)).toList();
    BlocProvider.of<DebtBloc>(context).add(DebtEvent(debts));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expenseBloc = BlocProvider.of<ExpenseBloc>(context);
    final totalAmount = expenseBloc.state.amount;
    final double shareAmount = _selectedPayees.isNotEmpty
        ? totalAmount / _selectedPayees.length
        : 0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              _buildHeader(),
              _buildAmountDisplay(totalAmount),
              _buildPayerSection(),
              _buildPayeeSection(),
              _buildShareDisplay(shareAmount),
              ElevatedButton(onPressed: _confirm, child: const Text('تایید')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() => Container(
    color: Colors.black12,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(" انتخاب هم‌خرج‌ها", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const add_expenses())),
        ),
      ],
    ),
  );

  Widget _buildAmountDisplay(double amount) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("بابته", style: TextStyle(fontSize: 20)),
        Text("${_formatAmount(amount)} تومان", style: const TextStyle(fontSize: 20)),
      ],
    ),
  );

  Widget _buildPayerSection() => Column(
    children: [
      const Text("کی حساب کرده؟", style: TextStyle(fontSize: 25)),
      const SizedBox(height: 20),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: ['حامد', 'امیر', 'حسن', 'محمد'].map((name) =>
              _buildUserButton(name, _selectedPayer == name, () => _handlePayerSelected(name))
          ).toList(),
        ),
      ),
    ],
  );

  Widget _buildPayeeSection() => Column(
    children: [
      const Text("برای کیا ؟", style: TextStyle(fontSize: 25)),
      const SizedBox(height: 20),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: ['حامد', 'امیر', 'حسن', 'محمد'].map((name) =>
              _buildUserButton(name, _selectedPayees.contains(name), () => _handlePayeeSelected(name))
          ).toList(),
        ),
      ),
    ],
  );

  Widget _buildShareDisplay(double share) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Text("سهم هر نفر: ${_formatAmount(share)} تومان",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ..._selectedPayees.map((p) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text("$p باید ${_formatAmount(share)} تومان بپردازد",
              style: const TextStyle(fontSize: 18)),
        )),
      ],
    ),
  );

  Widget _buildUserButton(String name, bool isSelected, VoidCallback onTap) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _getUserColor(name).withOpacity(isSelected ? 0.7 : 1.0),
          border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle),
            const SizedBox(width: 5),
            Text(name, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    ),
  );

  Color _getUserColor(String name) {
    switch (name) {
      case 'حامد': return const Color(0x8C979ADB);
      case 'امیر': return const Color(0x8CA3F1A3);
      case 'حسن': return const Color(0x8CC887DD);
      case 'محمد': return const Color(0x8CDB97C4);
      default: return Colors.grey;
    }
  }

  String _formatAmount(double amount) => amount.toStringAsFixed(0).replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},',
  );
}