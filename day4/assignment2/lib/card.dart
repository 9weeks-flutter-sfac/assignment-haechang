import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.imgUrl, required this.foodName});

  final String imgUrl;
  final String foodName;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(imgUrl, fit: BoxFit.cover),
            ),
            Text(foodName),
          ],
        ));
  }
}
