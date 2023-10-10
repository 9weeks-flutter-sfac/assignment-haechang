import 'package:assignment2/model/MenuCard.dart';
import 'package:assignment2/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  Dio dio = Dio();

  Future getData() async {
    var res = await dio.get('https://sniperfactory.com/sfac/http_json_data');
    if (res.statusCode == 200) {
      return res.data;
    } else {
      return Text('a');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              MenuCard menuCard = MenuCard.fromMap(snapshot.data["item"]);
              return CardWidget(menuCard: menuCard);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
