import 'package:flutter/material.dart';
import 'package:get/get.dart';

class welcome extends StatelessWidget {
  const welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hai Selamat Datang',
              style:
                  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Lets see how well\n your shrimp farm does\n in every aspect',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
        Expanded(
          child: Image.asset(
            'assets/image/kolam.png',
            width: Get.width * 0.5,
          ),
        ),
      ],
    );
  }
}