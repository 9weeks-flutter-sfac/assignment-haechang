import 'package:flutter/material.dart';
import 'package:assignment1/icon_toggle.dart';

class Assignment3 extends StatefulWidget {
  const Assignment3({super.key});

  @override
  State<Assignment3> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Assignment3> {
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
