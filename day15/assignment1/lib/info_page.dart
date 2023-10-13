import 'package:assignment1/coinController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CoinController>();
    var putController = Get.put(CoinController());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('상점'),
              Obx(() => Text('현재 보유한 코인 : ${controller.coin}')),
              ElevatedButton(
                onPressed: () {
                  putController.reset(0);
                },
                child: Text('코인리셋'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 상점
// 현재 보유한 코인 :
// 코인리셋
