import 'package:flutter/material.dart';

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
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Icon> correctList = [];
  PageController pageController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> quizs = [
      {
        "question": "의학적으로 얼굴과 머리를 구분하는 기준은 어디일까요?",
        "answer": 2,
        "options": ["코", "눈썹", "귀", "머리카락"]
      },
      {
        "question": "다음 중 바다가 아닌 곳은?",
        "answer": 3,
        "options": ["카리브해", "오호츠크해", "사해", "지중해"]
      },
      {
        "question": "심청이의 아버지 심봉사의 이름은?",
        "answer": 2,
        "options": ["심전도", "심학규", "심한길", "심은하"]
      },
      {
        "question": "심청전에서 심청이가 빠진 곳은 어디일까요?",
        "answer": 4,
        "options": ["정단수", "육각수", "해모수", "인당수"]
      },
      {
        "question": "택시 번호판의 바탕색은?",
        "answer": 3,
        "options": ["녹색", "흰색", "노란색", "파란색"]
      }
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => pageController.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                      icon: Icon(Icons.navigate_before),
                      color: Colors.white,
                    ),
                    Row(
                      children: correctList,
                    ),
                    IconButton(
                      onPressed: () => pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                      icon: Icon(Icons.navigate_next),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: quizs.length,
                  controller: pageController,
                  itemBuilder: (context, index) => QuizCard(
                      quiz: quizs[index],
                      onCorrect: () {
                        correctList.add(
                          Icon(
                            Icons.circle_rounded,
                            color: Colors.white,
                          ),
                        );
                        pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                        setState(() {});
                      },
                      onIncorrect: () {
                        correctList.add(Icon(
                          Icons.close,
                          color: Colors.white,
                        ));
                        pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                        setState(() {});
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: correctList.length == quizs.length
          ? FloatingActionButton(
              onPressed: () {
                correctList.clear();
                setState(() {});
                pageController.jumpToPage(0);
              },
              backgroundColor: Colors.black,
              child: Icon(Icons.refresh),
            )
          : null,
    );
  }
}

class QuizCard extends StatelessWidget {
  const QuizCard(
      {super.key,
      required this.quiz,
      required this.onCorrect,
      required this.onIncorrect});
  final Map<String, dynamic> quiz;
  final Function onCorrect;
  final Function onIncorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.fromLTRB(16, 54, 16, 54),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(24)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              quiz['question'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => ElevatedButton(
                  onPressed: () {
                    if (quiz['answer'] == index + 1) {
                      onCorrect();
                    } else {
                      onIncorrect();
                    }
                  },
                  child: Text(
                    quiz['options'][index],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
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
