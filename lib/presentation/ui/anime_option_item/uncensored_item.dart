import 'package:flutter/material.dart';

class UncensoredItem extends StatelessWidget {
  const UncensoredItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 2, right: 2),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: const Text('무삭제', style: TextStyle(fontSize: 12,color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
