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
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => TextField(
                      onChanged: controller.setEmail,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                          suffixIcon: controller.email.value != ''
                              ? IconButton(
                                  onPressed: () {
                                    controller.emailController.text =
                                        ''; // TextEditingController에 있는 clear()를 사용하면 value가 ''가 되는 게 아니라 다른 게 되어서 confirm이 작동하지 않는다.
                                    controller.email.value =
                                        ''; // Rx값인 password의 value에 넣어주기 까지 해야 작동한다.
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                  ),
                                )
                              : null,
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
                          suffixIcon: controller.password.value != ''
                              ? IconButton(
                                  onPressed: () {
                                    controller.pwController.text =
                                        ''; // TextEditingController에 있는 clear()를 사용하면 value가 ''가 되는 게 아니라 다른 게 되어서 confirm이 작동하지 않는다.
                                    controller.password.value =
                                        ''; // Rx값인 password의 value에 넣어주기 까지 해야 작동한다.
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                  ),
                                )
                              : null,
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
                          suffixIcon: controller.password2.value != ''
                              ? IconButton(
                                  onPressed: () {
                                    controller.pwController2.text =
                                        ''; // TextEditingController에 있는 clear()를 사용하면 value가 ''가 되는 게 아니라 다른 게 되어서 confirm이 작동하지 않는다.
                                    controller.password2.value = '';
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                  ),
                                )
                              : null,
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
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: controller.setName,
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                          suffixIcon: controller.username.value != ''
                              ? IconButton(
                                  onPressed: () {
                                    controller.usernameController.text =
                                        ''; // TextEditingController에 있는 clear()를 사용하면 value가 ''가 되는 게 아니라 다른 게 되어서 confirm이 작동하지 않는다.
                                    controller.username.value = '';
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                  ),
                                )
                              : null,
                          icon: Icon(Icons.badge),
                          labelText: '이름',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
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
