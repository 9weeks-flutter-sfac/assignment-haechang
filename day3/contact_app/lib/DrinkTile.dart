import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  const DrinkTile({
    super.key,
    required this.name_k,
    required this.name_e,
    required this.price,
    required this.imgUrl,
  });

  final String name_k;
  final String name_e;
  final String price;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage: AssetImage(imgUrl),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name_k,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              name_e,
              style: TextStyle(fontWeight: FontWeight.w200, color: Colors.grey),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              price,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}
