import 'package:flutter/material.dart';

class BottomNaviItem extends StatelessWidget {
  const BottomNaviItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            label: '태그검색'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.my_library_add),
            label: '보관함'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'MY'
        ),
      ],
    );
  }
}
