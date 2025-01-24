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
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("بابته",style: TextStyle(fontSize: 20),),
                      Text("10000"" ""تومان",style: TextStyle(fontSize: 20),),
                    ]
                  ),
                ),
                const SizedBox(height: 10,),
                Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Text("کی حساب کرده؟",style: TextStyle(fontSize: 25),),
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
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0x8C979ADB),
                            ),

                            child: const Row(
                              children: [
                                SizedBox(width: 5,),
                                Icon(Icons.account_circle),
                                SizedBox(width: 5,),
                                Text("حامد",style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: (){

                          },
                          child:Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0x8CA3F1A3),
                            ),

                            child: const Row(
                              children: [
                                SizedBox(width: 5,),
                                Icon(Icons.account_circle),
                                SizedBox(width: 5,),
                                Text("امیر",style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: (){

                          },
                          child:Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0x8CC887DD),
                            ),

                            child: const Row(
                              children: [
                                SizedBox(width: 5,),
                                Icon(Icons.account_circle),
                                SizedBox(width: 5,),
                                Text("حسن",style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: (){

                          },
                          child:Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0x8CDB97C4),
                            ),

                            child: const Row(
                              children: [
                                SizedBox(width: 5,),
                                Icon(Icons.account_circle),
                                SizedBox(width: 5,),
                                Text("محمد",style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Text("برای کیا ؟",style: TextStyle(fontSize: 25),),
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
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0x8C979ADB),
                            ),

                            child: const Row(
                              children: [
                                SizedBox(width: 5,),
                                Icon(Icons.account_circle),
                                SizedBox(width: 5,),
                                Text("حامد",style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: (){

                          },
                          child:Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0x8CA3F1A3),
                            ),

                            child: const Row(
                              children: [
                                SizedBox(width: 5,),
                                Icon(Icons.account_circle),
                                SizedBox(width: 5,),
                                Text("امیر",style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: (){

                          },
                          child:Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0x8CC887DD),
                            ),

                            child: const Row(
                              children: [
                                SizedBox(width: 5,),
                                Icon(Icons.account_circle),
                                SizedBox(width: 5,),
                                Text("حسن",style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: (){

                          },
                          child:Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0x8CDB97C4),
                            ),

                            child: const Row(
                              children: [
                                SizedBox(width: 5,),
                                Icon(Icons.account_circle),
                                SizedBox(width: 5,),
                                Text("محمد",style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

              ],
            ),


          )
      ),
    );
  }
}

