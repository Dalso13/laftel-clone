import 'package:flutter/material.dart';

class OriginalItem extends StatelessWidget {
  const OriginalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 2, right: 2),
      decoration: BoxDecoration(
        color: Colors.deepPurple[300],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: const Text('오리지널', style: TextStyle(fontSize: 12,color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
