import 'package:flutter/material.dart';

class HesabPage extends StatelessWidget {
  const HesabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('حساب کتاب'),

        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // بخش طلبکاری
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'طلبکاری های من',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'تومان ۷۵,۰۰۰',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // لیست بدهی‌ها
              Expanded(
                child: ListView(
                  children: [
                    _buildDebtItem('امیر', '۲۵,۰۰۰'),
                    _buildDebtItem('محمد', '۲۵,۰۰۰'),
                    _buildDebtItem('حسن', '۲۵,۰۰۰'),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDebtItem(String name, String amount) {
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
                Text(
                  '$amount تومان ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // عملیات یادآوری
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[50],
                    foregroundColor: Colors.blue[800],
                  ),
                  child: const Text('تسویه'),
                ),
                const SizedBox(height: 4,),
                // ElevatedButton(
                //   onPressed: () {
                //     // عملیات یادآوری
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.blue[50],
                //     foregroundColor: Colors.blue[800],
                //   ),
                //   child: const Text('یادآوری'),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}