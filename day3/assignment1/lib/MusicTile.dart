import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({
    super.key,
    required this.name,
    required this.singer,
    required this.imgUrl,
    required this.playTime,
  });

  final String name;
  final String singer;
  final String imgUrl;
  final String playTime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(6), child: Image.asset(imgUrl)),
      title: Text(
        name,
        overflow: TextOverflow.visible,
        maxLines: 2,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Text(
                      singer,
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis, color: Colors.white),
                    ),
                  ),
                  Text(
                    ' · ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    playTime,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      trailing: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
    );
  }
}
