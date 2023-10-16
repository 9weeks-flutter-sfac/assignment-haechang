import 'package:assignment1/view/login_page.dart';
import 'package:assignment1/view/main_page.dart';

class ApiRoutes {
  static const String authWithPassWord =
      '/api/collections/users/auth-with-password';

  static const String main = MainPage.route;
  static const String login = LoginPage.route;
}
