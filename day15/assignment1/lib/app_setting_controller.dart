import 'package:get/get.dart';

class AppSettingController extends GetxController {
  bool isSoundOn = false;
  bool isNotificationOn = false;
  String appVersion = '';
  String appName = '';
  String appAuthor = '';
  String appPackageName = '';
  DateTime? lastUpdated;
}
