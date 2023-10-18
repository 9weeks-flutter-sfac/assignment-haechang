import 'package:assignment1/controller/author_controller.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  var secretController = TextEditingController();
  var authorController = TextEditingController();
  var authorNameController = TextEditingController();

  RxString secret = ''.obs;
  RxString author = ''.obs;
  RxString authorName = ''.obs;

  void setSecret(String value) {
    secret.value = value;
  }

  void setAuthor(String value) {
    author.value = value;
  }

  void setAuthorName(String value) {
    authorName.value = value;
  }

  RxBool get secretConfirm => RxBool(secret.value != '');

  postData() async {
    try {
      var res = await Get.find<AuthorController>().dio.post(
        ApiRoutes.uploadSecret,
        data: {
          'secret': secretController.text,
          'author': authorController.text,
          'authorName': authorNameController.text,
        },
      );
      if (res.statusCode == 200) {
        print(res.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
