
import 'package:flutter/material.dart';

class information_card extends StatelessWidget {
  final String need;
  final String title;
  final IconData icon;
  final Color color;
  const information_card({
    super.key,
    required this.need,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    need,
                    style: TextStyle(
                        fontSize: 36, color: Colors.white),
                  ),
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            Icon(icon, color: Colors.white, size: 40,),
          ]),
    );
  }
}