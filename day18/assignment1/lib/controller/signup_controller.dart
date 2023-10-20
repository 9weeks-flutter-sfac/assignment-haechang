import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignupController extends GetxController {
  var emailController = TextEditingController();
  var pwController = TextEditingController();

  signUp() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: pwController.text);
  }
}
