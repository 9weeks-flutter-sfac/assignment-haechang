import 'package:assignment1/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore_for_file: prefer_const_constructors

class UploadPage extends GetView<UploadController> {
  const UploadPage({super.key});
  static const String route = '/upload';

  @override
  Widget build(BuildContext context) {
    localDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(221, 56, 239, 0.3),
              ),
              child: Center(
                child: Text(
                  '비밀 저장 완료',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Get.back();
                },
                child: Center(
                  child: Text('눌러서 닫기'),
                ),
              ),
            ],
          );
        },
      );
    } // 함수 선언을 async 내에 하면 안 되는 이유?

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.color),
          image: AssetImage('assets/anita-austvika-LTw2ld-5q4M-unsplash.jpg'),
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            '비밀 쓰기',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(minHeight: 200),
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    '본인의 비밀:',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(
                    () => TextField(
                      onChanged: controller.setSecret,
                      controller: controller.secretController,
                      maxLines: null,
                      decoration: InputDecoration(
                        suffixIcon: controller.secret.value != ''
                            ? IconButton(
                                onPressed: () {
                                  controller.secretController.text = '';
                                  controller.secret.value = '';
                                },
                                iconSize: 16,
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                ),
                              )
                            : null,
                        hintText: '비밀을 입력하세요',
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 166, 49, 198),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 166, 49, 198),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(
                    () => TextField(
                      onChanged: controller.setAuthor,
                      controller: controller.authorController,
                      maxLines: null,
                      decoration: InputDecoration(
                        suffixIcon: controller.author.value != ''
                            ? IconButton(
                                onPressed: () {
                                  controller.authorController.text = '';
                                  controller.author.value = '';
                                },
                                iconSize: 16,
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                ),
                              )
                            : null,
                        hintText: '아이디를 입력하세요(선택)',
                        hintStyle: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 166, 49, 198),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 166, 49, 198),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Obx(
                    () => TextField(
                      onChanged: controller.setAuthorName,
                      controller: controller.authorNameController,
                      maxLines: null,
                      decoration: InputDecoration(
                        suffixIcon: controller.authorName.value != ''
                            ? IconButton(
                                onPressed: () {
                                  controller.authorNameController.text = '';
                                  controller.authorName.value = '';
                                },
                                iconSize: 16,
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                ),
                              )
                            : null,
                        hintText: '이름을 입력하세요(선택)',
                        hintStyle: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 166, 49, 198),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 166, 49, 198),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              controller.secretConfirm.value == true
                                  ? MaterialStatePropertyAll(Colors.white)
                                  : MaterialStatePropertyAll(Colors.grey)),
                      onPressed: controller.secretConfirm.value == true
                          ? () async {
                              if (controller.secretController.text != '') {
                                controller.postData();
                                controller.secretController.text = '';
                                controller.authorController.text = '';
                                controller.authorNameController.text = '';
                                localDialog();
                              }
                            }
                          : null,
                      child: Text(
                        '저장하기',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 166, 49, 198),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
