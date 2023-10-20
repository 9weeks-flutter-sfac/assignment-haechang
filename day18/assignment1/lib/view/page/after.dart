import 'package:assignment1/controller/after_controller.dart';
import 'package:assignment1/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class After extends GetView<AfterController> {
  const After({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.user?.email ?? ''),
            Obx(
              () => Container(
                child: controller.emailVeri.value == false
                    ? TextButton(
                        onPressed: () async {
                          await controller.user?.sendEmailVerification();
                          print('인증 보냄');
                        },
                        child: Text(
                          '이 곳을 눌러 이메일 인증을 해주세요',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Text(
                        '이메일이 인증된 사용자입니다.',
                        style: TextStyle(color: Colors.green),
                      ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.find<AuthController>().logout();
              },
              child: Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
