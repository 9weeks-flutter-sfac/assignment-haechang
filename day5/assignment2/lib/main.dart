import 'package:flutter/material.dart';
import 'package:assignment2/icon_toggle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var myController = TextEditingController();

  Map toggleKeys = {
    '태양': GlobalKey(),
    '달': GlobalKey(),
    '별': GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            IconToggle(
              key: toggleKeys['태양'],
              whatIcon: Icons.sunny,
              iconColor: Colors.red,
              weather: 'Sun',
            ),
            IconToggle(
              key: toggleKeys['달'],
              whatIcon: Icons.nightlight,
              iconColor: Colors.yellow,
              weather: 'Moon',
            ),
            IconToggle(
              key: toggleKeys['별'],
              whatIcon: Icons.star,
              iconColor: Colors.yellow,
              weather: 'Star',
            ),
            TextField(
              controller: myController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: '키고 끄고 싶은 아이콘을 입력하세요.',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
              ),
              onSubmitted: (value) {
                var toggleKey = toggleKeys[value];
                if (toggleKey != null) {
                  var iconToggleState = toggleKey.currentState;
                  if (iconToggleState != null) {
                    iconToggleState.toggleIconColor(true);
                  }
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleKeys['태양'].currentState.toggleIconColor(false);
          toggleKeys['달'].currentState.toggleIconColor(false);
          toggleKeys['별'].currentState.toggleIconColor(false);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
