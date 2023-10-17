import 'package:assignment1/controller/auth_controller.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  logout() {
    Get.find<AuthController>().logout();
  }
}
