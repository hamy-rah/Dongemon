import 'package:flutter/material.dart';


class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "حساب کاربری",
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.black12,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Information
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("نام کاربری", style: TextStyle(fontSize: 20)),
                            Text(
                              "090182526360",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "ویرایش",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Notification Row with Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.notifications_on,
                        size: 50,
                      ),
                      SizedBox(width: 10),
                      Text("اعلان‌ها", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
              // Card information
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                        size: 50,
                      ),
                      SizedBox(width: 10),
                      Text("اطلاعات کارت بانکی",
                          style: TextStyle(fontSize: 17)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "ثبت کارت بانکی",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 230,
                width: 425,
                decoration: BoxDecoration(
                    color: const Color(0xFFFFD700),
                    borderRadius: BorderRadius.circular(20)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "نام بانک",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "6219 8619 0042 6650",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "حامد رحیمی",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.exit_to_app,
                      size: 40,
                    ),
                  ),
                  const Text(
                    "خروج از حساب کاربری",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}


