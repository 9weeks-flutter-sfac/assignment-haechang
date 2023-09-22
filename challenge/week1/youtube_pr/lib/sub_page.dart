import 'package:flutter/material.dart';

class SubPage extends StatefulWidget {
  const SubPage(
      {super.key,
      required this.name,
      required this.subTitle,
      required this.imgUrl});

  final String name;
  final String subTitle;
  final String imgUrl;

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.imgUrl),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                widget.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                widget.subTitle,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 300),
                        content: Text('이전 곡 재생은 준비 중인 기능입니다.'),
                      ),
                    );
                  },
                  icon: Icon(Icons.skip_previous),
                ),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 300),
                        content: Text('아이콘은 바뀐다.'),
                      ),
                    );
                    setState(() {
                      isPlay = !isPlay;
                    });
                  },
                  icon: isPlay ? Icon(Icons.play_arrow) : Icon(Icons.pause),
                ),
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text('다음 곡 재생은 준비 중인 기능입니다.'),
                        ),
                      );
                    },
                    icon: Icon(Icons.skip_next))
              ],
            )
          ],
        ),
      ),
    );
  }
}
