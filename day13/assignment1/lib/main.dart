// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment1/model/post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dio = Dio();
  List<Post> myData = [];

  getData() async {
    var res = await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (res.statusCode == 200) {
      List myList = res.data;
      myData = myList.map((e) => Post.fromMap(e)).toList();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade900),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) => index == 0
                  ? GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                  color: Colors.black,
                                  height: 200,
                                  child: Column(
                                    children: [
                                      Text(
                                        myData[index].title,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                        textAlign: TextAlign.start,
                                      ),
                                      Expanded(
                                        child: Text(
                                          myData[index].body,
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 18),
                                          textAlign: TextAlign.start,
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Post ${index + 1} ~ ${index + 5}',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 40,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  child: Text('${index + 1}'),
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        myData[index].title,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        myData[index].body,
                                        style: TextStyle(
                                            color: Colors.grey.shade500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : GestureDetector(
                      onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                                color: Colors.black,
                                height: 200,
                                child: Column(
                                  children: [
                                    Text(
                                      myData[index].title,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                    Text(
                                      myData[index].body,
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              )),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              child: Text('${index + 1}'),
                              backgroundColor: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    myData[index].title,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  Text(
                                    myData[index].body,
                                    style:
                                        TextStyle(color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              separatorBuilder: (context, index) => (index + 1) % 5 == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Post ${index + 2} ~ ${index + 6}',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 40,
                            ),
                          ),
                        )
                      ],
                    )
                  : SizedBox.shrink(),
              itemCount: myData.length),
        ),
      ),
    );
  }
}
