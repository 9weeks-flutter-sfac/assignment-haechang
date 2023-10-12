import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.imgUrl, required this.myUser});
  final String imgUrl;
  final User myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(myUser.name),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInLeft(
            delay: Duration(milliseconds: 500),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imgUrl),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: -48,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(imgUrl),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 48,
          ),
          FadeInLeft(
            delay: Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                myUser.name,
                style: TextStyle(fontSize: 36, color: Colors.grey),
              ),
            ),
          ),
          Divider(
            height: 24,
          ),
          FadeInLeft(
            delay: Duration(milliseconds: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                  child: Text(
                    'Information',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(Icons.mail),
                      ),
                      Text(myUser.email)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(Icons.phone),
                      ),
                      Text(myUser.phone)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(Icons.location_city),
                      ),
                      Text('${myUser.address.city}, '),
                      Text('${myUser.address.street}, '),
                      Text('${myUser.address.suite}, '),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 48,
          ),
          FadeInLeft(
            delay: Duration(milliseconds: 1300),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Company',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(myUser.company.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(myUser.company.catchPhrase),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(myUser.company.bs),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
