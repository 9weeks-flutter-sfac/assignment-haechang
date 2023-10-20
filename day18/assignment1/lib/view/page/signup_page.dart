import 'package:assignment1/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends GetView<SignupController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
            ),
            TextField(
              controller: controller.pwController,
            ),
            TextButton(
              onPressed: () {
                controller.signUp();
              },
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
