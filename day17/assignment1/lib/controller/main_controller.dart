import 'package:assignment1/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  logout() {
    Get.find<AuthController>().logout();
    FirebaseAuth.instance.signOut();
  }
}
