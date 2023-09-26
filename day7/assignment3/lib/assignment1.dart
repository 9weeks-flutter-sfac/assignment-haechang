import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:math';

class Assignment1 extends StatefulWidget {
  Assignment1({super.key});

  @override
  State<Assignment1> createState() => _Assignment1State();
}

class _Assignment1State extends State<Assignment1> {
  final imageUrl = [
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/33053/dog-young-dog-small-dog-maltese.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/10361796/pexels-photo-10361796.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/9409823/pexels-photo-9409823.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  String _currentImageUrl =
      "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('7일차 과제 1번'),
      ),
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          onRefresh: () {
            int randomIndex = Random().nextInt(4);
            _currentImageUrl = imageUrl[randomIndex];
            setState(() {});
            _refreshController.refreshCompleted();
          },
          onLoading: () {
            _refreshController.loadComplete();
          },
          controller: _refreshController,
          child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(_currentImageUrl)),
          )),
    );
  }
}
