import 'package:assignment1/MusicTile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: Icon(Icons.navigate_before),
          title: Text(
            '아워리스트',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.airplay),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Color.fromARGB(255, 77, 77, 77),
              ),
            ),
          ),
          child: ListView(
            children: [
              MusicTile(
                  name: 'Come with me',
                  singer: 'Surfaces 및 salem ilese',
                  imgUrl: 'assets/music_come_with_me.png',
                  playTime: '3:00'),
              MusicTile(
                  name: 'Good day',
                  singer: 'Surfaces',
                  imgUrl: 'assets/music_good_day.png',
                  playTime: '3:00'),
              MusicTile(
                  name: 'Honesty',
                  singer: 'Pink Sweat\$',
                  imgUrl: 'assets/music_honesty.png',
                  playTime: '3:09'),
              MusicTile(
                  name: 'I Wish I Missed My Ex',
                  singer: '마할리아 버크마',
                  imgUrl: 'assets/music_i_wish_i_missed_my_ex.png',
                  playTime: '3:24'),
              MusicTile(
                  name: 'Plastic Plants',
                  singer: '마할리아 버크마',
                  imgUrl: 'assets/music_plastic_plants.png',
                  playTime: '3:20'),
              MusicTile(
                  name: 'Sucker for you',
                  singer: '맷 테리',
                  imgUrl: 'assets/music_sucker_for_you.png',
                  playTime: '3:24'),
              MusicTile(
                  name: 'Summer is for falling in love',
                  singer:
                      'Sarah Kang & Eye Love Brandonsdfsdfsdfsdfsdfdssdfsdfsdf',
                  imgUrl: 'assets/music_summer_is_for_falling_in_love.png',
                  playTime: '3:00'),
              MusicTile(
                  name:
                      'These days(feat. Jess Glynne, Macklemore & Dan Caplen)',
                  singer: 'Rudimental',
                  imgUrl: 'assets/music_these_days.png',
                  playTime: '3:00'),
              MusicTile(
                  name: 'You Make Me',
                  singer: 'DAY6',
                  imgUrl: 'assets/music_you_make_me.png',
                  playTime: '3:00'),
              MusicTile(
                  name: 'Zombie Pop',
                  singer: 'DRP IAN',
                  imgUrl: 'assets/music_zombie_pop.png',
                  playTime: '3:00'),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 75,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 42, 42, 42),
              border: Border(
                  bottom:
                      BorderSide(color: Color.fromARGB(255, 176, 174, 174)))),
          child: ListTile(
            leading: Image.asset('assets/music_you_make_me.png'),
            title: Text(
              'You Make Me',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Day6',
              style: TextStyle(color: Color.fromARGB(255, 179, 179, 179)),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          currentIndex: 2,
          backgroundColor: Color.fromARGB(255, 42, 42, 42),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: '홈'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: '둘러보기'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_music,
                  color: Colors.white,
                ),
                label: '보관함')
          ],
        ),
      ),
    );
  }
}
