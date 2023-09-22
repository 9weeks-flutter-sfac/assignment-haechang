import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({super.key});

  @override
  State<Assignment1> createState() => _Assignment1State();
}

class _Assignment1State extends State<Assignment1> {
  List animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];

  var _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5일차 과제'),
      ),
      body: SafeArea(
        child: ListView.builder(
            controller: _scrollController,
            itemCount: animalList.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 300,
                child: Center(
                  child: Text(animalList[index]),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        child: Icon(Icons.vertical_align_top),
      ),
    );
  }
}
