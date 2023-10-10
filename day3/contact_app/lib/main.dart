import 'package:contact_app/DrinkTile.dart';
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          leading: Icon(Icons.navigate_before),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'new'.toUpperCase(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              DrinkTile(
                  name_k: '골든 미모사 그린티',
                  name_e: 'Golden Mimosa Green Tea',
                  imgUrl: 'assets/images/item_drink1.jpeg',
                  price: '6100원'),
              DrinkTile(
                  name_k: '골든 미모사 그린티',
                  name_e: 'Golden Mimosa Green Tea',
                  imgUrl: 'assets/images/item_drink1.jpeg',
                  price: '6100원'),
              DrinkTile(
                  name_k: '골든 미모사 그린티',
                  name_e: 'Golden Mimosa Green Tea',
                  imgUrl: 'assets/images/item_drink1.jpeg',
                  price: '6100원'),
              DrinkTile(
                  name_k: '골든 미모사 그린티',
                  name_e: 'Golden Mimosa Green Tea',
                  imgUrl: 'assets/images/item_drink1.jpeg',
                  price: '6100원'),
              DrinkTile(
                  name_k: '골든 미모사 그린티',
                  name_e: 'Golden Mimosa Green Tea',
                  imgUrl: 'assets/images/item_drink1.jpeg',
                  price: '6100원'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Pay'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: '1'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: '2'),
          ],
        ),
        bottomSheet: Container(
          height: 56,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  '주문할 매장을 선택해주세요',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.expand_more,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
