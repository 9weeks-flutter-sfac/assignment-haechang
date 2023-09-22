import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  const MusicTile(
      {super.key,
      required this.name,
      required this.singer,
      required this.imgUrl,
      required this.playTime,
      required this.navigateFunc});
  final String name;
  final String singer;
  final String imgUrl;
  final String playTime;
  final VoidCallback navigateFunc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigateFunc,
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(6), child: Image.asset(imgUrl)),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            name,
            overflow: TextOverflow.visible,
            maxLines: 2,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.check_circle, size: 18),
            SizedBox(
              width: 4,
            ),
            Flexible(
              child: Text(
                singer,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(' · '),
            SizedBox(
              width: 4,
            ),
            Text(
              playTime,
            ),
          ],
        ),
        trailing: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
    );
  }
}
