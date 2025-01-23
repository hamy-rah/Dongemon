import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_bloc.dart';
import 'user_event.dart';

class AddEkip extends StatelessWidget {
  const AddEkip({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: AddEkipPage(),
      ),
    );
  }
}

class AddEkipPage extends StatefulWidget {
  const AddEkipPage({super.key});

  @override
  State<AddEkipPage> createState() => _AddEkipPageState();
}

class _AddEkipPageState extends State<AddEkipPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "  ایجاد اکیپ",
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_forward)),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            const Center(child: Text('یک اسم براش انتخاب کن!',style: TextStyle(fontSize: 20),)),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'نام',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white12,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: InkWell(
            onTap: (){
              final name = _nameController.text.trim();
              if (name.isNotEmpty) {
                context.read<UserBloc>().add(AddUser(name: name));
                _nameController.clear();
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('لطفاً فیلد را پر کنید')),
                );
              }
            },
            child: Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30)),

              child: const Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 30,
                  ),
                  Text(
                    "  افزودن اکیپ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

          ),


        ),
      ),
    );
  }
}