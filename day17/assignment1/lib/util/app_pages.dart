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
    GetPage(name: AppRoutes.author, page: () => const AuthorPage()),
    GetPage(name: AppRoutes.first, page: () => const FirstPage()),
    GetPage(name: AppRoutes.main, page: () => const MainPage()),
    GetPage(name: AppRoutes.secret, page: () => const SecretPage()),
    GetPage(name: AppRoutes.signUp, page: () => const SignUpPage()),
    GetPage(name: AppRoutes.upload, page: () => UploadPage()),
  ];
}
