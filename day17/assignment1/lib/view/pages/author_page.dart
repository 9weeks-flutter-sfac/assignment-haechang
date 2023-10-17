import 'package:animate_do/animate_do.dart';
import 'package:assignment1/controller/author_controller.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:assignment1/model/user.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore_for_file: prefer_const_constructors

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

  static const String route = '/author';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.color),
          image: AssetImage('assets/anita-austvika-LTw2ld-5q4M-unsplash.jpg'),
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            '작성자 페이지',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder(
          future: Future.delayed(
            Duration(seconds: 1),
            () => Get.find<AuthorController>().dio.get(ApiRoutes.getUserAuth),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<Record> list =
                  (snapshot.data!.data["items"] as List<dynamic>)
                      .map((e) => Record.fromMap(e))
                      .toList();
              return Center(
                child: GridView.builder(
                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => BounceInDown(
                    delay: Duration(milliseconds: index * 100),
                    child: Card(
                      child: Center(child: Text('${list[index].username}')),
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: Dance(
                infinite: true,
                child: Image.asset('assets/black-cat_1.png'),
              ),
            );
          },
        ),
      ),
    );
  }
}
