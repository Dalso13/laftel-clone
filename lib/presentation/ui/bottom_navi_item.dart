import 'package:flutter/material.dart';

class BottomNaviItem extends StatelessWidget {
  final void Function(int index) _changeScreen;
  final int _currentIndex;

  const BottomNaviItem({
    super.key,
    required void Function(int) changeScreen,
    required int currentIndex,
  })  : _changeScreen = changeScreen,
        _currentIndex = currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _changeScreen,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      selectedItemColor: Colors.deepPurple,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '홈',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined), label: '태그검색'),
        BottomNavigationBarItem(icon: Icon(Icons.my_library_add), label: '보관함'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined), label: 'MY'),
      ],
    );
  }
}
