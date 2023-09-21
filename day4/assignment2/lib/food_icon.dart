import 'package:flutter/material.dart';

class FoodIcon extends StatelessWidget {
  const FoodIcon({
    super.key,
    required this.imgUrl,
    required this.foodName,
  });
  final String imgUrl;
  final String foodName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey, spreadRadius: 0.5, offset: Offset(1, 1)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imgUrl,
              height: 80,
              width: 125,
              fit: BoxFit.cover,
            ),
            Text(
              foodName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text('[담기]')
          ],
        ),
      ),
    );
  }
}
