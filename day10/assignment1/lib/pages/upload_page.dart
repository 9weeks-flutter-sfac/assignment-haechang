import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';
// ignore_for_file: prefer_const_constructors

class UploadPage extends StatelessWidget {
  UploadPage({super.key});

  final TextEditingController secretController = TextEditingController();

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
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Text('눌러서 닫기'),
                ),
              ),
            ],
          );
        },
      );
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.color),
          image:
              AssetImage('assets/stefan-steinbauer-HK8IoD-5zpg-unsplash.jpg'),
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
              color: Colors.white70,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '본인의 비밀:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: secretController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: '비밀을 입력하세요',
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
                TextButton(
                  onPressed: () async {
                    await SecretCatApi.addSecret(secretController.text);
                    secretController.text = '';
                    localDialog();
                  },
                  child: Text(
                    '저장하기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 166, 49, 198),
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
