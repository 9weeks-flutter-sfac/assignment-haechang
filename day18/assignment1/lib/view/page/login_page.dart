import 'package:assignment1/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(border: Border.all()),
              width: 300,
              child: Column(
                children: [
                  TextField(
                    controller: controller.idController,
                    decoration: InputDecoration(
                      label: Text('email'),
                    ),
                  ),
                  TextField(
                    controller: controller.pwController,
                    decoration: InputDecoration(
                      label: Text('pw'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.emailLogin(controller.idController.text,
                          controller.pwController.text);
                    },
                    child: Text('이메일 로그인'),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                controller.signInWithFacebook();
              },
              child: Text('페이스북 로그인'),
            ),
            TextButton(
              onPressed: () {
                controller.signUp();
              },
              child: Text('회원가입'),
            ),
            TextButton(
                onPressed: () {
                  controller.logout();
                },
                child: Text('로그아웃'))
          ],
        ),
      ),
    );
  }
}
