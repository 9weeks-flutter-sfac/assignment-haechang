// ignore_for_file: prefer_const_constructors
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:profile_app/widget/user_widget.dart';
import 'package:animate_do/animate_do.dart';

import 'model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var dio = Dio();

  List<User> user = [];

  getData() async {
    var res = await dio.get('https://jsonplaceholder.typicode.com/users');
    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      user = data
          .map(
            (e) => User.fromMap(e),
          )
          .toList();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, index) => FadeInLeft(
          delay: Duration(milliseconds: index * 150),
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserWidget(
                      myUser: user[index],
                      imgUrl:
                          'https://xsgames.co/randomusers/assets/avatars/male/${index}.jpg',
                    ))),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://xsgames.co/randomusers/assets/avatars/male/${index}.jpg'),
              ),
              title: Text(user[index].name),
              subtitle: Text(user[index].email),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
        ),
      ),
    );
  }
}
