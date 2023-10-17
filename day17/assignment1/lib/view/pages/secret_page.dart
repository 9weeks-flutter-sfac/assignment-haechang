import 'package:animate_do/animate_do.dart';
import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/model/secrets.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore_for_file: prefer_const_constructors

class SecretPage extends StatelessWidget {
  const SecretPage({super.key});
  static const String route = '/secret';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.color),
          image: AssetImage('assets/anita-austvika-LTw2ld-5q4M-unsplash.jpg'),
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
          future: Future.delayed(Duration(seconds: 1),
              () => Get.find<AuthController>().dio.get(ApiRoutes.callList)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<Secrets> list =
                  (snapshot.data!.data["items"] as List<dynamic>)
                      .map((e) => Secrets.fromMap(e))
                      .toList();
              return Center(
                child: CarouselSlider(
                  items: list.map((e) {
                    return Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color.fromRGBO(100, 72, 200, 0.8)),
                      child: Center(
                        child: Text(
                          e.secret,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
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
