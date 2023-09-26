import 'package:flutter/material.dart';
import 'package:assignment3/assignment1.dart';
import 'package:assignment3/assignment2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      child: PageView(
        children: [Assignment1(), Assignment2()],
      ),
    ));
  }
}
