import 'package:dongemon/choosing_partners.dart';
import 'package:dongemon/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ThousandSeparator.dart';

class add_expenses extends StatefulWidget {
  const add_expenses({super.key});

  @override
  State<add_expenses> createState() => _add_expensesState();
}

class _add_expensesState extends State<add_expenses> {
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
                  Container(
                    color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "  افزودن خرج جدید",
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              });
                            },
                            icon: const Icon(Icons.arrow_forward)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const dropdown_choise(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // فقط ارقام مجاز هستند
                        ThousandsSeparatorInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        labelText: "مبلغ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: "بابت چی؟",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white12,
              shape: const CircularNotchedRectangle(),
              notchMargin: 8.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const Choosing()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(30)),
                      height: 100,
                      width: 150,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                          Text(
                            "انتخاب هم‌خرج‌ها",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        });
                      },
                      child: const Text(
                        "بیخیال",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}

class dropdown_choise extends StatefulWidget {
  const dropdown_choise({super.key});

  @override
  _dropdown_choiseState createState() => _dropdown_choiseState();
}

class _dropdown_choiseState extends State<dropdown_choise> {
  // مقدار انتخاب‌شده
  String? selectedValue;

  // لیست گزینه‌ها
  final List<String> dropdownItems = ['اکیپ ۱', 'اکیپ ۲', 'اکیپ ۳', 'اکیپ ۴'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Center(child: Text('یک اکیپ را انتخاب کنید')),
      // متن پیش‌فرض
      value: selectedValue,
      // مقدار انتخاب‌شده
      items: dropdownItems.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Center(child: Text(item)),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue; // به‌روزرسانی مقدار انتخاب‌شده
        });
      },
      isExpanded: true, // کشیدن باکس به عرض کامل (اختیاری)
    );
  }
}
