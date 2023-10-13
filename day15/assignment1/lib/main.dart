import 'package:assignment1/coinController.dart';
import 'package:assignment1/info_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final controller = Get.put(CoinController());
  bool isStart = false;

  @override
  Widget build(BuildContext context) {
    isStart == false ? {controller.startTimer(), isStart = true} : null;
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => Text(
                    'Current coin : ${controller.coin}',
                    style: TextStyle(fontSize: 24),
                  )),
              FaIcon(FontAwesomeIcons.bitcoin,
                  size: 96.0, color: Colors.yellow.shade700),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => Market());
                  },
                  child: Text('상점으로 이동하기'))
            ],
          ),
        ),
      ),
    );
  }
}
