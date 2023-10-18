import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var emailController = TextEditingController();
  var pwController = TextEditingController();
  var pwController2 = TextEditingController();
  var usernameController = TextEditingController();

  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString password2 = ''.obs;
  RxString username = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setConfirmPassword(String value) {
    password2.value = value;
  }

  void setName(String value) {
    username.value = value;
  }

  RxBool get emailConfirm => RxBool(
      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email.value));
  // 정규표현식에는 hasMatch를 사용해서 인수가 그에 맞는 형식인지를 확인할 수 있다.

  RxBool get passwordMatchConfirm => RxBool(password.value == password2.value);

  RxBool get passwordConfirm => RxBool(password.value.length >= 9);
}
