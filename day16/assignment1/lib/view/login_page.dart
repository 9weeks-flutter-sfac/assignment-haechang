import 'package:assignment1/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'id'),
                controller: controller.idController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'pw'),
                obscureText: true,
                controller: controller.pwController,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: const Text('로그인'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
