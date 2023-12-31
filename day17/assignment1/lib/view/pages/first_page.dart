import 'package:assignment1/controller/login_controller.dart';
import 'package:assignment1/util/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends GetView<LoginController> {
  const FirstPage({super.key});
  static const String route = '/first';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.grey.withOpacity(0.5), BlendMode.color),
          fit: BoxFit.cover,
          image: const AssetImage(
              'assets/anita-austvika-LTw2ld-5q4M-unsplash.jpg'),
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Get.width * 0.8,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                height: Get.height * 0.1,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(100, 72, 200, 0.3),
                    borderRadius: BorderRadius.circular(16)),
                child: const Center(
                  child: Text(
                    '비밀?',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Obx(
                  () => Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('로그인'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: controller.setId,
                          controller: controller.idController,
                          decoration: InputDecoration(
                              suffixIcon: controller.id.value != ''
                                  ? IconButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                      ),
                                      onPressed: () {
                                        controller.idController.clear();
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                      ),
                                    )
                                  : null,
                              icon: const Icon(Icons.person),
                              labelText: '아이디',
                              labelStyle:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: controller.setPassword,
                                controller: controller.pwController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  suffixIcon: controller.password.value != ''
                                      ? IconButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.blue),
                                          ),
                                          onPressed: () {
                                            controller.pwController.clear();
                                          },
                                          icon: const Icon(
                                            Icons.clear,
                                          ),
                                        )
                                      : null,
                                  errorText: (controller
                                                  .passwordConfirm.value ==
                                              true) || // 비밀번호가 9자 이상이거나, 처음에 비어있을 때는 null
                                          (controller.password.value == '')
                                      ? null
                                      : '비밀번호는 9자 이상이어야 합니다',
                                  icon: const Icon(Icons.security),
                                  labelText: '비밀번호',
                                  labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      controller.passwordConfirm.value == true
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.login();
                                },
                                child: const Text(
                                  '로그인',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: ElevatedButton(
                                onPressed: null,
                                child: Text(
                                  '로그인',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                      TextButton(
                        child: const Text(
                          'Google로 로그인하기',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        onPressed: () {
                          controller.googleLogin();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(100, 72, 200, 0.5),
                  ),
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.signUp);
                },
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
