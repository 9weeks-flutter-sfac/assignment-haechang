import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/login_controller.dart';
import 'package:assignment1/controller/main_controller.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:assignment1/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => MainController());
      }),
      getPages: [
        GetPage(name: LoginPage.route, page: () => LoginPage()),
        GetPage(name: MainPage.route, page: () => MainPage()),
      ],
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => Get.toNamed(ApiRoutes.login),
            child: const Text('Go'),
          ),
        ),
      ),
    );
  }
}
