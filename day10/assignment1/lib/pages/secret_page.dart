import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';
// ignore_for_file: prefer_const_constructors

class SecretPage extends StatelessWidget {
  const SecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.color),
          image:
              AssetImage('assets/stefan-steinbauer-HK8IoD-5zpg-unsplash.jpg'),
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            '비밀 페이지',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder(
          future: Future.delayed(
              Duration(seconds: 1), () => SecretCatApi.fetchSecrets()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: CarouselSlider(
                  items: snapshot.data!.asMap().entries.map((e) {
                    return Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(246, 72, 255, 0.4)),
                      child: Center(
                        child: e.value.secret != ''
                            ? Text(
                                e.value.secret,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            : Text(
                                '내용 없음',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                      height: 90,
                      autoPlay: true,
                      autoPlayInterval: Duration(milliseconds: 2500),
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      autoPlayCurve: Curves.fastOutSlowIn),
                ),
              );
            }
            return Center(
              child: Dance(
                infinite: true,
                child: Image.asset('assets/black-cat_1.png'),
              ),
            );
          },
        ),
      ),
    );
  }
}
