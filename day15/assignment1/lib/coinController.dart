import 'package:get/get.dart';
import 'dart:async';

class CoinController extends GetxController {
  // RxList<String> memos = RxList<String>();
  var coin = 0.obs;
  void reset(int value) => coin(value);
  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (_) {
      coin++;
    });
  }

  @override
  void onInit() {
    // statefulWidget의 initState와 같다.
    // TODO: implement onInit
    super.onInit();

    ever(
        coin,
        (_) => coin % 10 == 0 && coin != RxInt(0)
            ? Get.snackbar('코인${coin}개 돌파!', '축하합니다!')
            : null);
  }
}
