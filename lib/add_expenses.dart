import 'package:dongemon/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/expense_bloc.dart';
import 'choosing_partners.dart';
import 'user_bloc.dart';

class add_expenses extends StatefulWidget {
  const add_expenses({super.key});

  @override
  State<add_expenses> createState() => _add_expensesState();
}

class _add_expensesState extends State<add_expenses> {
  final TextEditingController _amountController = TextEditingController();
  String? _selectedGroup;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 30),
                _buildGroupSelector(),
                const SizedBox(height: 30),
                _buildAmountField(),
                const SizedBox(height: 30),
                _buildDescriptionField(),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomBar(),
        ),
      ),
    );
  }

  Widget _buildHeader() => Container(
    color: Colors.black12,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("  افزودن خرج جدید", style: TextStyle(fontSize: 20)),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );

  Widget _buildGroupSelector() => Container(
    decoration: BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 40),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: BlocBuilder<UserBloc, UserState>(
      builder: (context, state) => DropdownButton<String>(
        isExpanded: true,
        hint: const Center(child: Text('یک اکیپ را انتخاب کنید')),
        value: _selectedGroup,
        items: state.users.map((user) => DropdownMenuItem(
          value: user.name,
          child: Center(child: Text(user.name)),
        )).toList(),
        onChanged: (value) => setState(() => _selectedGroup = value),
      ),
    ),
  );

  Widget _buildAmountField() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
      controller: _amountController,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        ThousandsSeparatorInputFormatter(),
      ],
      decoration: InputDecoration(
        labelText: "مبلغ",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );

  Widget _buildDescriptionField() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: "بابت چی؟",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );

  Widget _buildBottomBar() => BottomAppBar(
    color: Colors.white12,
    shape: const CircularNotchedRectangle(),
    notchMargin: 8.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildNextButton(),
        _buildCancelButton(),
      ],
    ),
  );

  Widget _buildNextButton() => InkWell(
    borderRadius: BorderRadius.circular(30),
    onTap: () {
      final amount = double.tryParse(_amountController.text.replaceAll(',', '')) ?? 0.0;
      context.read<ExpenseBloc>().add(ExpenseEvent(
          amount: amount,
          selectedGroup: _selectedGroup
      ));
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Choosing()));
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 100,
      width: 150,
      child: const Row(
        children: [
          Icon(Icons.arrow_back, size: 30),
          Text("انتخاب هم‌خرج‌ها", style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    ),
  );

  Widget _buildCancelButton() => TextButton(
    onPressed: () => Navigator.pop(context),
    child: const Text(
      "بیخیال",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
    ),
  );
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) return newValue;

    final cleanText = newValue.text.replaceAll(',', '');
    if (cleanText.isEmpty) return newValue;

    final formattedText = cleanText.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]},',
    );

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}