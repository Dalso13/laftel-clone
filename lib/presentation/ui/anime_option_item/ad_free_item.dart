import 'package:flutter/material.dart';

class AdFreeItem extends StatelessWidget {
  const AdFreeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 2, right: 2),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: const Text(
        '광고 무료',
        style: TextStyle(
          color: Colors.orangeAccent,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
