import 'package:assignment1/model/user.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  Dio dio = Dio();

  User? get user => _user.value;
  var token;

  _handleAuthChanged(User? data) {
    if (data != null) {
      Get.toNamed(ApiRoutes.main);
    }
    Get.toNamed(ApiRoutes.login);
  }

  login(String id, String pw) async {
    dio.options.baseUrl =
        "http://52.79.115.43:8090"; // baseUrl은 Url에서 바뀌지 않는 부분, 예를 들면 classum.com 이런 부분이다.
    try {
      var res = await dio.post(ApiRoutes.authWithPassWord, data: {
        'identity': id,
        'password': pw,
      });
      if (res.statusCode == 200) {
        _user(User.fromMap(res.data));
        token = user!.token;
        Get.toNamed(ApiRoutes.main);
      }
    } catch (e) {
      print(e);
      Get.toNamed(ApiRoutes.login);
    }
  }

  logout() {
    _user.value = null;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
