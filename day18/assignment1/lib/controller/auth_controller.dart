import 'package:assignment1/view/page/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/route_manager.dart';

class AuthController extends GetxController {
  var idController = TextEditingController();
  var pwController = TextEditingController();

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken?.token ?? '');

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  logout() {
    FirebaseAuth.instance.signOut();
  }

  emailLogin(String id, String pw) {
    print(pwController.text);
    FirebaseAuth.instance.signInWithEmailAndPassword(email: id, password: pw);
  }

  signUp() {
    Get.to(() => SignUp());
  }
}
