import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.foodName, required this.imgUrl});

  final String foodName;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Image.asset(
            imgUrl,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          foodName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text('[담기]')
      ]),
    );
  }
}
