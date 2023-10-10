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


/**
 *
 * ItemCount를 지정하지 않으면, 무한대로 생성하게 된다.
 * Column 안에 ListView가 들어가면 사이즈 에러가 남
 * ListView에 높이를 정해야 함
 * 스크롤을 하는데, Scroll하는 영역을 무제한으로 정하면 안 되기 때문이다.
 * ListView에서 스크롤 방향을 바꿔서 메뉴를 만들 수도 있다.
 * onDeleted를 넣으면, 자동으로 아이콘이 생긴다.
 * map 함수는 인덱스를 생성하지 않는다. asMap 등을 사용해야 한다.
 * builder는 인덱스를 생성한다. 때문에 인덱스를 사용할 때에는 ListView나 그런 것들의 builder를 사용해주는 것이 좋다.
 * 위젯 하나 당 하나의 파일을 만드는 것이 유지보수에 좋다.
 *
 */