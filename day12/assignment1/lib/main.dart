import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Dio dio = Dio();
  SharedPreferences? prefs;

  List<String> orderList = [];

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  void initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      var myList = prefs!.getStringList('key');
      orderList = myList ?? [];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('분식왕 이테디 주문하기'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('주문 리스트'),
            Wrap(
              children: orderList.isNotEmpty
                  ? orderList
                      .asMap()
                      .entries
                      .map((e) => Chip(
                            label: Text(e.value),
                            onDeleted: () {
                              orderList.removeAt(e.key);
                              setState(() {});
                            },
                          ))
                      .toList()
                  : [Text('주문한 메뉴가 없습니다.')],
            ),
            Text('음식'),
            FutureBuilder(
              future: dio.get(
                  'http://52.79.115.43:8090/api/collections/options/records'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final response = snapshot.data;
                  return Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data?.data.length ?? 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            orderList.add(
                              response.data["items"][index]["menu"],
                            );
                            if (prefs != null) {
                              prefs!.setStringList("key", orderList);
                            }
                            setState(() {});
                          },
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    response!.data["items"][index]["imageUrl"],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(response.data["items"][index]["menu"]),
                                Text('[담기]')
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('결제하기'),
      ),
    );
  }
}
