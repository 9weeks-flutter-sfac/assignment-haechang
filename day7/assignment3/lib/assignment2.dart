import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2> {
  final imageUrl = [
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/33053/dog-young-dog-small-dog-maltese.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/10361796/pexels-photo-10361796.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/9409823/pexels-photo-9409823.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('7일차 과제 2번'),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
              height: 250.0,
              autoPlay: true,
              autoPlayInterval: Duration(milliseconds: 2500)),
          items: imageUrl.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(24)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        i,
                        fit: BoxFit.cover,
                      ),
                    ));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
