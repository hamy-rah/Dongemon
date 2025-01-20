import 'package:flutter/material.dart';

import 'Account.dart';
import 'Home.dart';
import 'add_expenses.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // صفحه پیش‌فرض: خانه

  final List<Widget> _pages = [
    const add_expenses(),
    const Home(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              setState(() {
                _currentIndex = 0; // صفحه "ساخت اکتیویتی جدید" فعال شود
              });
            },
            backgroundColor: Colors.teal,
            child: const Icon(Icons.add, size: 32),

          ),
          const SizedBox(height: 4), // فاصله بین دکمه و متن

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.home, size: 35,),
              color: _currentIndex == 1 ? Colors.teal : Colors.grey,
              onPressed: () {
                setState(() {
                  _currentIndex = 1; // صفحه خانه فعال شود
                });
              },

            ),
            const Text(
              "خرج جدید", // متن زیر دکمه
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.person,size: 35,),
              color: _currentIndex == 2 ? Colors.teal : Colors.grey,
              onPressed: () {
                setState(() {
                  _currentIndex = 2; // صفحه حساب کاربری فعال شود
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}