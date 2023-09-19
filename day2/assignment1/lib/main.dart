import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: '오늘의 하루는',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '어땠나요?',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  height: 200,
                  margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: PageView(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black, Colors.white],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            '우울함',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.orange, Colors.yellow],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            '행복함',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blue, Colors.green],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            '상쾌함',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black12,
                ),
                Container(
                  height: 100,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  color: Colors.blue,
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.account_circle,
                            size: 50,
                          ),
                        ),
                        Container(
                          width: 290,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                child: RichText(
                                  text: TextSpan(
                                    text: '라이언',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Text(
                                '게임개발',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'C#, Unity',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
