import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/author_controller.dart';
import 'package:assignment1/controller/login_controller.dart';
import 'package:assignment1/controller/main_controller.dart';
import 'package:assignment1/controller/signUp_controller.dart';
import 'package:assignment1/controller/upload_controller.dart';
import 'package:assignment1/firebase_options.dart';
import 'package:assignment1/util/app_pages.dart';
import 'package:assignment1/view/pages/first_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController(),
            fenix:
                true); // fenix를 true로 하면 GetX 컨트롤러가 캐시에서 제거되어도 다시 필요한 경우 컨트롤러를 다시 생성할 수 있다.
        Get.lazyPut(() => SignupController(), fenix: true);
        Get.lazyPut(() => MainController(), fenix: true);
        Get.lazyPut(() => AuthorController(), fenix: true);
        Get.lazyPut(() => UploadController(), fenix: true);
      }),
      getPages: AppPages.pages,
      theme: ThemeData(fontFamily: 'neo'),
      home: const FirstPage(),
    );
  }
}
