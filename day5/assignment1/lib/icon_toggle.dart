import 'package:flutter/material.dart';

class IconToggle extends StatefulWidget {
  const IconToggle(
      {super.key,
      required this.whatIcon,
      required this.iconColor,
      required this.weather});

  final String weather;
  final IconData whatIcon;
  final Color iconColor;

  @override
  State<IconToggle> createState() => _IconToggleState();
}

class _IconToggleState extends State<IconToggle> {
  bool isIconColored = false;

  void toggleIconColor(a) {
    setState(() {
      if (a == false) {
        isIconColored = false;
      } else {
        isIconColored = !isIconColored;
      }
    });
  }

  Color getIconColor() {
    return isIconColored ? widget.iconColor : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Icon(
            widget.whatIcon,
            color: getIconColor(),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            widget.weather,
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          IconButton(
              onPressed: () => toggleIconColor(true),
              icon: Icon(Icons.arrow_right))
        ],
      ),
    );
  }
}
