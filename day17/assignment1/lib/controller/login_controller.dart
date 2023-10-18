import 'package:assignment1/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var idController = TextEditingController();
  var pwController = TextEditingController();

  RxString password = ''.obs;
  RxString id = ''.obs;

  login() {
    Get.find<AuthController>().login(idController.text, pwController.text);
    idController.text = '';
    pwController.text = '';
  }

  void setId(String value) {
    id.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  RxBool get passwordConfirm => RxBool(password.value.length >= 9);
}
