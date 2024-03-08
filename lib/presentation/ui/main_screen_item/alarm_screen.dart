import 'package:flutter/material.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('알림'),
      ),
      body: const Center(
        child: Text('알림 메시지가 없습니다.'),
      ),
    );
  }
}
