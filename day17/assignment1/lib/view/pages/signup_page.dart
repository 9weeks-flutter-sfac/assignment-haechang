// ignore_for_file: prefer_const_constructors
import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/signUp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignupController> {
  const SignUpPage({super.key});
  static const String route = '/signup';

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
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            '회원가입',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => TextField(
                      onChanged: controller.setEmail,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                          errorText: (controller.emailConfirm.value ==
                                      true) || // 이메일 형식이 아닐 때이거나, 처음에 비어있을 때는 null
                                  controller.email.value == ''
                              ? null
                              : '올바른 이메일 형식이 아닙니다',
                          icon: Icon(Icons.person),
                          labelText: '이메일',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => TextField(
                      onChanged: controller.setPassword,
                      controller: controller.pwController,
                      decoration: InputDecoration(
                          errorText: (controller.passwordConfirm.value ==
                                      true) || // 비밀번호가 9자 이상이거나, 처음에 비어있을 때는 null
                                  (controller.password.value == '')
                              ? null
                              : '비밀번호는 9자 이상이어야 합니다',
                          icon: Icon(Icons.lock),
                          labelText: '비밀번호',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => TextField(
                      onChanged: controller.setConfirmPassword,
                      controller: controller.pwController2,
                      decoration: InputDecoration(
                          errorText: controller.passwordMatchConfirm.value ==
                                      true ||
                                  controller.password2.value ==
                                      '' // 두 개의 비밀번호가 같지 않거나 처음에 비밀번호 확인 칸이 비워져 있을 때 null
                              ? null
                              : '비밀번호가 일치하지 않습니다',
                          icon: Icon(Icons.lock),
                          labelText: '비밀번호 확인',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.badge),
                        labelText: '이름',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: controller.passwordMatchConfirm.value == true &&
                              controller.passwordConfirm.value == true &&
                              controller.emailConfirm.value == true
                          ? ElevatedButton(
                              onPressed: () {
                                Get.find<AuthController>().signUp(
                                    controller.emailController.text,
                                    controller.pwController.text,
                                    controller.pwController2.text,
                                    controller.usernameController.text);
                              },
                              child: Text('회원가입'),
                            )
                          : ElevatedButton(
                              onPressed:
                                  null, // null로 주면 기능도 없어지고, 색도 회색, 눌렀을 때 애니메이션도 나오지 않게 된다.
                              child: Text('회원가입'),
                            ),
                    ),
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
