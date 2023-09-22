import 'package:flutter/material.dart';
import 'package:assignment1/assignment_1.dart';
import 'package:assignment1/assignment_2.dart';
import 'package:assignment1/assignment3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('5일차 과제'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Assignment1(),
                      ),
                    );
                  },
                  child: Text('1번 과제')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Assignment2(),
                      ),
                    );
                  },
                  child: Text('2번 과제')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Assignment3(),
                      ),
                    );
                  },
                  child: Text('3번 과제')),
            ],
          ),
        ));
  }
}
