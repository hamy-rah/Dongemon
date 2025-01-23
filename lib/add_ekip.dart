import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'homepage.dart';
import 'user_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';

class AddEkip extends StatefulWidget {
  const AddEkip({super.key});

  @override
  State<AddEkip> createState() => _AddEkipState();
}

class _AddEkipState extends State<AddEkip> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'افزودن اکیپ',
      home: BlocProvider(
        create: (context) => UserBloc(),
        child: AddEkipPage(),
      ),
    );
  }
}

class AddEkipPage extends StatefulWidget {
  AddEkipPage({super.key});

  @override
  State<AddEkipPage> createState() => _AddEkipPageState();
}

class _AddEkipPageState extends State<AddEkipPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<UserBloc>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // Scaffold اضافه شد
        appBar: AppBar(
          title: Center(child: Text('یک اسم براش انتخاب کن!')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // فرم وارد کردن نام
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'نام',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final name = _nameController.text.trim();
                  if (name.isNotEmpty) {
                    userBloc.add(AddUser(name: name));
                    _nameController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('لطفاً فیلد را پر کنید')),
                    );
                  }
                },
                child: Text('افزودن اکیپ'),
              ),
              SizedBox(height: 20),
              // لیست کاربران
              Expanded(
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state.users.isEmpty) {
                      return Center(
                        child: Text('هیچ کاربری اضافه نشده است'),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(user.name[0].toUpperCase()),
                            ),
                            title: Text(user.name),
                            trailing: IconButton(
                              onPressed: () {
                                userBloc.add(RemoveUser(index));
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
