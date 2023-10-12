// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widget/filter_bottom_sheet.dart';
import 'package:todo_app/widget/todo_card.dart';

import 'model/todo.dart';

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

  List<Todo>? myTodo;

  Future getData() async {
    var res = await dio.get('https://jsonplaceholder.typicode.com/todos');
    List listRes = res.data;
    myTodo = listRes.map((e) => Todo.fromMap(e)).toList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  TodoFilter todoFilter = TodoFilter.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        title: Text(
          'Todo App',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => FilterBottomSheet(
                    filter: todoFilter,
                    onApply: (value) {
                      setState(() {
                        todoFilter = value;
                      });
                    })),
            icon: Icon(Icons.filter_list),
          ),
          IconButton(
              onPressed: () {
                getData();
              },
              icon: Icon(Icons.refresh))
        ],
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: myTodo!.length,
          itemBuilder: (context, index) =>
              TodoCard(todo: changeFilter(myTodo!)[index])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
        },
      ),
    );
  }

  List<Todo> changeFilter(List<Todo> value) {
    switch (todoFilter) {
      case TodoFilter.all:
        return value;
      case TodoFilter.completed:
        return value
            .where(
              (element) => element.completed == true,
            )
            .toList();
      case TodoFilter.incompleted:
        return value.where((element) => element.completed == false).toList();
    }
  }
}
