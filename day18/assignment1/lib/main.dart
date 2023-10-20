import 'package:assignment1/controller/after_controller.dart';
import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/signup_controller.dart';
import 'package:assignment1/firebase_options.dart';
import 'package:assignment1/view/page/after.dart';
import 'package:assignment1/view/page/assignment_page.dart';
import 'package:assignment1/view/page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        print('회원가입 or 유저 옴');
        Get.to(() => After());
        return;
      } else {
        print('회원가입이나 로그인 필요');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => AfterController());
        Get.lazyPut(() => SignupController());
        Get.put(AuthController());
      }),
      home: LoginPage(),
    );
  }
}
