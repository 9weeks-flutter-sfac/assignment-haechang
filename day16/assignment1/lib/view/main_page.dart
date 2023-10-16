import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: PageView(
            controller: controller.pageController,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: controller.check == RxBool(true)
                      ? [
                          Text(
                            '안녕하세요! ${controller.authController.user!.record.name}입니다.',
                            style: const TextStyle(fontSize: 36),
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount: controller.document.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      controller.document[index].title,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Text(controller.document[index].content),
                                ],
                              ),
                            ),
                          ),
                          Image.network(
                              controller.document[3].attachment_url as String),
                        ]
                      : [const Text('')],
                ),
              ),
              const SizedBox(
                width: 300,
                height: 300,
                child: Text('b'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.curPage.value,
          onTap: controller.onPageTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), label: 'My'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          controller.readDocuments();
        }),
      ),
    );
  }
}
