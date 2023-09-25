import 'package:assignment1/widget/ContactTile.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ContactTile(
            imgUrl: 'https://picsum.photos/150/150',
            name: '이테디',
            phone: '010-0000-0000')
      ],
    );
  }
}
