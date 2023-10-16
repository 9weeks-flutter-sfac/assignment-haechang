import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/document.dart';

class MainController extends GetxController {
  var pageController = PageController();
  var authController = Get.find<AuthController>();

  RxInt curPage = 0.obs;
  List<Document>? document;

  onPageTapped(int v) {
    pageController.jumpToPage(v);
    curPage(v);
  }

  logout() {
    Get.toNamed(ApiRoutes.login);
  }

  readDocuments() async {
    Map<String, dynamic> headers = {
      'Authorization': authController.token,
    };
    var res = await authController.dio.get(
      'http://52.79.115.43:8090/api/collections/documents/records',
      options: Options(headers: headers),
    );
    document = (res.data["items"] as List<dynamic>)
        .map((e) => Document.fromMap(e))
        .toList();
  }
}
