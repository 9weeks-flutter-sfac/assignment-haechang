import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.curPage.value,
          onTap: controller.onPageTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
          ],
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${controller.authController.user?.record.username}님 안녕하세요',
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  controller.check == RxBool(true)
                      ? Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemBuilder: (context, index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          controller.document?[index].title ??
                                              '',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(controller
                                                .document?[index].content ??
                                            ''),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  itemCount: controller.document?.length ?? 0,
                                ),
                              ),
                              Container(
                                height: 250,
                                child: Image.network(
                                    '${controller.document![3].attachment_url}'),
                              )
                            ],
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    controller.authController.logout();
                  },
                  child: Text('로그아웃')),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.readDocuments,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
