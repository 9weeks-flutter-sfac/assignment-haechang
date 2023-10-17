import 'package:animate_do/animate_do.dart';
import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/main_controller.dart';
import 'package:assignment1/util/app_routes.dart';
import 'package:assignment1/view/widget/menu_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore_for_file: prefer_const_constructors

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.grey.withOpacity(0.5), BlendMode.color),
          fit: BoxFit.cover,
          image: AssetImage('assets/anita-austvika-LTw2ld-5q4M-unsplash.jpg'),
        ),
      ),
      child: Obx(
        () => Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: Get.find<AuthController>().delay.value == false
              ? Center(
                  child: Dance(
                    infinite: true,
                    child: Image.asset('assets/black-cat_1.png'),
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Dance(
                        infinite: true,
                        duration: Duration(seconds: 5),
                        child: Image.asset('assets/black-cat_1.png'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      MenuBox(
                        delay: 300,
                        text: '작성자 보기',
                        route: AppRoutes.author,
                      ),
                      MenuBox(
                        delay: 600,
                        text: '비밀 보기',
                        route: AppRoutes.secret,
                      ),
                      MenuBox(
                        delay: 900,
                        text: '비밀 쓰기',
                        route: AppRoutes.upload,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(100, 72, 200, 0.7))),
                          onPressed: () {
                            controller.logout();
                          },
                          child: Text('로그아웃'),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
