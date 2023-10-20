import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AfterController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  RxBool emailVeri = RxBool(false);

  updateVeri() {
    emailVeri.value = user!.emailVerified;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateVeri();
  }
}
