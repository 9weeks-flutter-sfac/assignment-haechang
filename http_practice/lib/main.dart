import 'package:dio/dio.dart';
import 'dart:math';

void main() {
  void sendPostRequest() async {
    final dio = Dio();
    for (var i = 100; i <= 150; i++) {
      try {
        final response = await dio.post(
          'https://sniperfactory.com/sfac/http_assignment_${i}',
          options: Options(headers: {
            'user-agent': 'SniperFactoryBrowser',
            'authorization': '123'
          }),
        );
        if (response.statusCode == 200) {
          print(response.data);
        } else {
          print(response.data);
        }
      } catch (e) {
        // 요청이 실패하거나 예외가 발생한 경우 처리
        print('Error: $e');
      }
    }
  } // POST 요청 보내기

  sendPostRequest();
}
