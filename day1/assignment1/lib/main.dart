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
        body: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: '이듬해 질 녘 꽃 피는 ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                      text: '봄',
                      style:
                          TextStyle(color: Color.fromARGB(255, 231, 76, 65))),
                  TextSpan(
                    text: ' 한여름 밤의 꿈\n가을 타 겨울 내릴 눈 일 년 네 번 또다시 ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '봄',
                    style: TextStyle(color: Color.fromARGB(255, 231, 76, 65)),
                  ),
                  TextSpan(
                      text: '\n정들었던 내 젊은 날 이제는 안녕\n아름답던 우리의 ',
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: '봄',
                      style:
                          TextStyle(color: Color.fromARGB(255, 231, 76, 65))),
                  TextSpan(
                      text: ' 여름 가을 겨울\n(Four seasons with no reason)',
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                    text: '\n\n비',
                    style: TextStyle(color: Color.fromARGB(255, 88, 166, 230)),
                  ),
                  TextSpan(
                    text: ' 갠 뒤에 ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '비',
                    style: TextStyle(color: Color.fromARGB(255, 88, 166, 230)),
                  ),
                  TextSpan(
                    text: '애 대신 a happy end\n',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '비',
                    style: TextStyle(color: Color.fromARGB(255, 88, 166, 230)),
                  ),
                  TextSpan(
                    text:
                        '스듬히 씩 비웃듯 칠색 무늬의 무지개\n철없이 철 지나 철들지 못해 (still)\n철부지에 철 그른지 오래\nMarchin\' ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '비',
                    style: TextStyle(color: Color.fromARGB(255, 88, 166, 230)),
                  ),
                  TextSpan(
                    text: '발디, 차이코프스키\n오늘의 사계를 맞이해 (boy)',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '\n\n마침내',
                    style: TextStyle(color: Color.fromARGB(255, 125, 101, 29)),
                  ),
                  TextSpan(
                    text:
                        ', 마치 넷이 못내\n저 하늘만 바라보고서\n사계절 잘 지내고 있어, goodbye\n떠난 사람 또 나타난 사람\n머리 위 저세상, 난 떠나 영감의 amazon\n지난 밤의 트라우마 다 묻고\n목숨 바쳐 달려올 새 출발 하는 ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '왕복선',
                    style: TextStyle(color: Color.fromARGB(255, 125, 101, 29)),
                  ),
                  TextSpan(
                    text:
                        '\n\n변할래 전보다는 더욱더\n좋은 사람 더욱더, 더 나은 사람 더욱더\n아침 이슬을 맞고 (내 안에)\n내 안에 분노 과거에 묻고',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nFor life, do it away, away, away',
                    style: TextStyle(color: Colors.purple),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
