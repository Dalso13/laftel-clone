import 'package:flutter/material.dart';

class LaftelOnlyItem extends StatelessWidget {
  const LaftelOnlyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 2, right: 2),
      decoration: BoxDecoration(
        color: Colors.deepPurple[300],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: const Text('ONLY', style: TextStyle(fontSize: 12,color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
