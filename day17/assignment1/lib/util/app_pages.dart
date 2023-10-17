import 'package:assignment1/view/pages/author_page.dart';
import 'package:assignment1/view/pages/first_page.dart';
import 'package:assignment1/view/pages/main_page.dart';
import 'package:assignment1/view/pages/secret_page.dart';
import 'package:assignment1/view/pages/signup_page.dart';
import 'package:assignment1/view/pages/upload_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.author, page: () => AuthorPage()),
    GetPage(name: AppRoutes.first, page: () => FirstPage()),
    GetPage(name: AppRoutes.main, page: () => MainPage()),
    GetPage(name: AppRoutes.secret, page: () => SecretPage()),
    GetPage(name: AppRoutes.signUp, page: () => SignUpPage()),
    GetPage(name: AppRoutes.upload, page: () => UploadPage()),
  ];
}
