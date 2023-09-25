import 'package:assignment1/screen/contact_screen.dart';
import 'package:assignment1/screen/history_screen.dart';
import 'package:assignment1/screen/setting_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('내 연락처'),
        actions: [],
      ),
      body: [
        ContactScreen(),
        HistoryScreen(),
        SettingScreen()
      ][currentScreenIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentScreenIndex,
          onTap: (value) {
            currentScreenIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '연락처'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '통화기록'),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '설정',
            ),
          ]),
    );
  }
}
