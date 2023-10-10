import 'package:flutter/material.dart';
import 'package:practice/q4_screen.dart';

class Q1Screen extends StatelessWidget {
  const Q1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5일차 과제'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton(
            child: Text('4번 과제'),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Q4Screen()));
            },
          )
        ]),
      ),
    );
  }
}
