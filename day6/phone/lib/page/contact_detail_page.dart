import 'package:flutter/material.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage(
      {super.key,
      required this.name,
      required this.phone,
      required this.image});
  final String name;
  final String phone;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(
            image,
            width: double.infinity,
            height: 140,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
