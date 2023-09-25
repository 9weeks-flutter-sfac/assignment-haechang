import 'package:assignment1/page/contact_detail_page.dart';
import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.phone});

  final String imgUrl;
  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContactDetailPage(
            name: name,
            phone: phone,
            image: imgUrl,
          ),
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
      ),
      title: Text(name),
      subtitle: Text(phone),
      trailing: Icon(Icons.call),
    );
  }
}
