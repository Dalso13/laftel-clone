import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('업로드 공지'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('새로운 공지가 없습니다'),
      ),
    );
  }
}
