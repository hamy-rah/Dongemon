import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/debt_bloc.dart';

class HesabPage extends StatelessWidget {
  const HesabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('حساب کتاب')),
        body: BlocBuilder<DebtBloc, List<Debt>>(
          builder: (context, debts) {
            final total = debts.fold(0.0, (sum, debt) => sum + debt.amount);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTotalCard(total),
                  const SizedBox(height: 20),
                  Expanded(child: _buildDebtList(debts)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTotalCard(double total) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'طلبکاری های من',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _formatAmount(total),
              style: TextStyle(
                fontSize: 24,
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDebtList(List<Debt> debts) {
    return ListView.builder(
      itemCount: debts.length,
      itemBuilder: (context, index) => _buildDebtItem(debts[index]),
    );
  }

  Widget _buildDebtItem(Debt debt) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${_formatAmount(debt.amount)} تومان',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(debt.name, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[50],
                foregroundColor: Colors.blue[800],
              ),
              child: const Text('تسویه'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatAmount(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
    );
  }
}