// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:assignment2/food_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List orderList = [];

  void _addItem(foodName) {
    setState(() {
      orderList.add(foodName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '분식왕 이테디 주문하기',
          style: TextStyle(fontSize: 24),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '주문 리스트',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 16),
              child: Text(orderList.toString())),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '음식',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () => _addItem('떡볶이'),
                  child: FoodIcon(
                      imgUrl: 'assets/option_bokki.png', foodName: '떡볶이')),
              GestureDetector(
                  onTap: () => _addItem('맥주'),
                  child: FoodIcon(
                      imgUrl: 'assets/option_beer.png', foodName: '맥주')),
              GestureDetector(
                  onTap: () => _addItem('김밥'),
                  child: FoodIcon(
                      imgUrl: 'assets/option_kimbap.png', foodName: '김밥')),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () => _addItem('오므라이스'),
                  child: FoodIcon(
                      imgUrl: 'assets/option_omurice.png', foodName: '오므라이스')),
              GestureDetector(
                onTap: () => _addItem('돈까스'),
                child: FoodIcon(
                    imgUrl: 'assets/option_pork_cutlets.png', foodName: '돈까스'),
              ),
              GestureDetector(
                  onTap: () => _addItem('라면'),
                  child: FoodIcon(
                      imgUrl: 'assets/option_ramen.png', foodName: '라면')),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () => _addItem('우동'),
                  child: FoodIcon(
                      imgUrl: 'assets/option_udon.png', foodName: '우동')),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            orderList = [];
          });
        },
        label: Text('초기화하기'),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.0)),
      ),
    );
  }
}
