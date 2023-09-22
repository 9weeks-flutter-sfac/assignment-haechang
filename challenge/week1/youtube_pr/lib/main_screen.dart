import 'package:flutter/material.dart';
import 'package:youtube_pr/music_tile.dart';
import 'package:youtube_pr/sub_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.navigate_before),
        title: Text(
          '아워리스트',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.airplay),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: [
          MusicTile(
            name: 'Come with me',
            singer: 'Surfaces 및 salem ilese',
            imgUrl: 'assets/music_come_with_me.png',
            playTime: '3:00',
            navigateFunc: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubPage(
                          imgUrl: 'assets/music_come_with_me.png',
                          name: 'Come with me',
                          subTitle: 'Surfaces 및 salem ilese',
                        )),
              );
            },
          ),
          MusicTile(
            name: 'Good Day',
            singer: 'Surfaces',
            imgUrl: 'assets/music_good_day.png',
            playTime: '3:00',
            navigateFunc: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubPage(
                          imgUrl: 'assets/music_good_day.png',
                          name: 'Good Day',
                          subTitle: 'Surfaces',
                        )),
              );
            },
          ),
          MusicTile(
            name: 'Honesty',
            singer: 'PinkSweat\$',
            imgUrl: 'assets/music_honesty.png',
            playTime: '3:00',
            navigateFunc: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubPage(
                          imgUrl: 'assets/music_honesty.png',
                          name: 'Honesty',
                          subTitle: 'PinkSweat\$',
                        )),
              );
            },
          ),
          MusicTile(
            name: 'Summer is for falling in love',
            singer: 'Sarah Kang & Eye Love Brandon',
            imgUrl: 'assets/music_summer_is_for_falling_in_love.png',
            playTime: '3:00',
            navigateFunc: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubPage(
                          imgUrl:
                              'assets/music_summer_is_for_falling_in_love.png',
                          name: 'Summer is for falling in love',
                          subTitle: 'Sarah Kang & Eye Love Brandon',
                        )),
              );
            },
          ),
        ],
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: ListTile(
              leading: Image.asset('assets/music_you_make_me.png'),
              title: Text(
                'You Make me',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text('Day6'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.play_arrow,
                  ),
                  Icon(Icons.skip_next)
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            alignment: Alignment.centerLeft,
            child: Container(width: 120, color: Colors.white),
          )
        ],
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
    );
  }
}
