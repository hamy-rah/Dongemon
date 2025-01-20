import 'package:dongemon/add_expenses.dart';
import 'package:flutter/material.dart';


class Choosing extends StatefulWidget {
  const Choosing({super.key});

  @override
  State<Choosing> createState() => _ChoosingState();
}

class _ChoosingState extends State<Choosing> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
                      const Column(
                        children: [
                          Text(" انتخاب هم‌خرج‌ها",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          Text("اکیپ ۱",style: TextStyle(fontSize: 15),),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const add_expenses()));
                            });
                          },
                          icon: const Icon(Icons.arrow_forward)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Text("کی حساب کرده؟"),
                    const SizedBox(height:20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10,),

                        InkWell(
                          onTap: (){

                          },
                          child:Container(
                            height: 50,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue,
                            ),

                            child: const Row(
                              children: [
                                Icon(Icons.account_circle),
                                Text("hamed")
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: (){},
                          child:Container(
                            height: 50,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue,
                            ),

                            child: const Row(
                              children: [
                                Icon(Icons.account_circle),
                                Text("hamed")
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),

                        InkWell(
                          onTap: (){},
                          child:Container(
                            height: 50,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue,
                            ),

                            child: const Row(
                              children: [
                                Icon(Icons.account_circle),
                                Text("hamed")
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),

                        InkWell(
                          onTap: (){},
                          child:Container(
                            height: 50,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue,
                            ),

                            child: const Row(
                              children: [
                                Icon(Icons.account_circle),
                                Text("hamed")
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )

              ],
            ),


          )
      ),
    );
  }
}

