import 'package:flutter/cupertino.dart';

class StorageBoxMenuScreen extends StatelessWidget {
  const StorageBoxMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('작품 (0)'),
            ],
          ),
          Expanded(
            child: Center(
              child: Text('작품이 아직 없어요'),
            ),
          ),
        ],
      ),
    );
  }
}
