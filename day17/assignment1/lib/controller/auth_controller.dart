import 'package:assignment1/model/user.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:assignment1/util/app_routes.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  Dio dio = Dio();
  RxBool delay = RxBool(false);
  var token;

  _handleAuthChanged(User? data) async {
    if (data != null) {
      Get.offAndToNamed(AppRoutes.main); // 로그인하면 스택에 쌓인 first 페이지는 삭제한다.
      await Future.delayed(const Duration(seconds: 1));
      delay.value = true;
    } else {
      delay.value = false;
      Get.offAndToNamed(
          AppRoutes.first); // offAndToNamed는 현재 페이지를 스택에서 제거하고 전 페이지로 이동하는 것.
    }
  } // 앱을 켰을 때 로그인 되어 있으면 바로 메인으로, 아니면 로그인 화면으로 보내는 함수, onInit에 넣는다.

  login(String id, String pw) async {
    try {
      var res = await dio.post(
        ApiRoutes.authWithPassWord,
        data: {'identity': id, 'password': pw},
      );
      if (res.statusCode == 200) {
        print('로그인 성공!');
        _user(User.fromMap(res.data));
        token = _user.value!.token;
      }
    } catch (e) {
      Get.snackbar('아이디 또는 비밀번호를 잘못 입력했습니다.', '입력하신 내용을 다시 확인해주세요');
    }
  }

  signUp(String email, String password, String passwordConfirm,
      String username) async {
    try {
      var res = await dio.post(ApiRoutes.signUpAuth, data: {
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'username': username
      });
      if (res.statusCode == 200) {
        Get.toNamed(AppRoutes.first);
      }
    } catch (e) {
      printError();
    }
  }

  logout() {
    token = null;
    _user.value = null;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
