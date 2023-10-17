import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MenuBox extends StatelessWidget {
  const MenuBox(
      {super.key,
      required this.text,
      required this.route,
      required this.delay});

  final String text;
  final String route;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElasticIn(
        delay: Duration(milliseconds: delay),
        child: InkWell(
          onTap: () => Get.toNamed(route),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(0, 0, 0, 0.7)),
            width: Get.width * 0.75,
            height: 60,
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade300,
                  fontSize: 20),
            )),
          ),
        ),
      ),
    );
  }
}
