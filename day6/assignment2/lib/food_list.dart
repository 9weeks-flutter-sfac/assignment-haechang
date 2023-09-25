import 'package:assignment3/admin_page.dart';
import 'package:assignment3/food_card.dart';
import 'package:flutter/material.dart';

class FoodList extends StatefulWidget {
  FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final List<String> foodName = ['떡볶이', '맥주', '김밥', '오무라이스', '돈까스', '라면', '우동'];

  final List<String> image = [
    'assets/option_bokki.png',
    'assets/option_beer.png',
    'assets/option_kimbap.png',
    'assets/option_omurice.png',
    'assets/option_pork_cutlets.png',
    'assets/option_ramen.png',
    'assets/option_udon.png'
  ];

  final List orderList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onDoubleTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => AdminPage()),
                  ),
                ),
            child: Text('분식왕 이테디 주문하기')),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '주문 리스트',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                orderList.isNotEmpty
                    ? Wrap(
                        children: orderList.asMap().entries.map(
                          (e) {
                            return Chip(
                              label: Text(e.value),
                              deleteIcon: Icon(Icons.close),
                              onDeleted: () {
                                orderList.removeAt(e.key);
                                setState(() {});
                              },
                            );
                          },
                        ).toList(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text('주문한 메뉴가 없습니다')),
                      ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 3),
                itemCount: foodName.length,
                itemBuilder: (context, index) => Container(
                    child: GestureDetector(
                        onTap: () {
                          orderList.add(foodName[index]);
                          setState(() {});
                        },
                        child: FoodCard(
                            foodName: foodName[index], imgUrl: image[index]))),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: orderList.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: Text('결제하기'),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
