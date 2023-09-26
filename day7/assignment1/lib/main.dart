import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> words = [
      {"word": "apple", "meaning": "사과", "example": "I want to eat an apple"},
      {
        "word": "paper",
        "meaning": "종이",
        "example": "Could you give me a paper"
      },
      {
        "word": "resilient",
        "meaning": "탄력있는, 회복력있는",
        "example": "She's a resilient girl"
      },
      {
        "word": "revoke",
        "meaning": "취소하다",
        "example":
            "The authorities have revoked their original decision to allow development of this rural area."
      },
      {
        "word": "withdraw",
        "meaning": "철회하다",
        "example":
            "After lunch, we withdrew into her office to finish our discussion in private."
      },
    ];

    PageController _pageController = PageController(initialPage: 0);

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
            width: double.infinity,
            height: 200,
            child: PageView.builder(
                controller: _pageController,
                itemCount: words.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        words[index]['word'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            letterSpacing: -1),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        words[index]['meaning'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: -1),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        words[index]['example'].toString(),
                        style: TextStyle(letterSpacing: -1),
                      ),
                    ],
                  );
                })),
      )),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment:
                Alignment(Alignment.bottomLeft.x + 0.2, Alignment.bottomLeft.y),
            child: FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
              child: Icon(Icons.navigate_before),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
              child: Icon(Icons.navigate_next),
            ),
          )
        ],
      ),
    );
  }
}
