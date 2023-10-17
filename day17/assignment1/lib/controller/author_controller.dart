import 'package:assignment1/model/user.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthorController extends GetxController {
  Dio dio = Dio();

  RxList<Record>? userList = RxList<Record>();

  getData() async {
    try {
      var res = await dio.get(ApiRoutes.getUserAuth);
      if (res.statusCode == 200) {
        userList = RxList((res.data["items"] as List<dynamic>)
            .map((e) => Record.fromMap(e))
            .toList());
        print(userList.runtimeType);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
