import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'pages/author_page.dart';
import 'pages/secret_page.dart';
import 'pages/upload_page.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'neo'),
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter:
                ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.color),
            fit: BoxFit.cover,
            image:
                AssetImage('assets/stefan-steinbauer-HK8IoD-5zpg-unsplash.jpg'),
          ),
        ),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: MainPage(),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Dance(
                infinite: true,
                duration: Duration(seconds: 5),
                child: Image.asset('assets/black-cat_1.png')),
            SizedBox(
              height: 30,
            ),
            ElasticIn(
              delay: Duration(milliseconds: 500),
              duration: Duration(seconds: 3),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecretPage(),
                      ),
                    );
                  },
                  child: ListTile(
                    tileColor: Color.fromRGBO(246, 72, 255, 0.4),
                    title: Center(
                      child: Text(
                        '비밀 보기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElasticIn(
              delay: Duration(seconds: 1),
              duration: Duration(seconds: 3),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthorPage(),
                      ),
                    );
                  },
                  child: ListTile(
                    tileColor: Color.fromRGBO(246, 72, 255, 0.4),
                    title: Center(
                      child: Text(
                        '작성자 보기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElasticIn(
              delay: Duration(milliseconds: 1500),
              duration: Duration(seconds: 3),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadPage(),
                      ),
                    );
                  },
                  child: ListTile(
                    tileColor: Color.fromRGBO(246, 72, 255, 0.4),
                    title: Center(
                      child: Text(
                        '비밀 쓰기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
