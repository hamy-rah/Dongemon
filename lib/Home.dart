import 'package:flutter/material.dart';
import 'add_ekip.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "اکی‍ب ها",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.group_add_outlined,
                        size: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      const AddEkip()
                                  ));
                            });
                          },
                          child: const Text(
                            "ساخت اکیپ جدید",
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 200,
                    width: 400,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "نام اکیپ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "وضعیت",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 200,
                    width: 400,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "نام اکیپ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "وضعیت",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
