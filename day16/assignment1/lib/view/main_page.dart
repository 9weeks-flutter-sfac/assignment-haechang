import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            Column(
              children: [
                Text(controller.document?[0].title ?? 'null'),
                Text(controller.document?[1].title ?? 'null'),
                Text(controller.document?[2].title ?? 'null'),
                Text(controller.document?[3].title ?? 'null'),
                Image.network(controller.document?[3].attachment_url ?? '')
              ],
            ), // 여기에 첫 번째 페이지 위젯을 넣으세요
            Container(
              child: Text('b'),
              width: 300,
              height: 300,
            ), // 여기에 두 번째 페이지 위젯을 넣으세요
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.curPage.value,
          onTap: controller.onPageTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), label: 'My'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.readDocuments();
      }),
    );
  }
}
