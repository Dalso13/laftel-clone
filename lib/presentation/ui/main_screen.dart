import 'package:flutter/material.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/main_screen_item.dart';
import 'package:laftel_clone/presentation/ui/storage_box_item/storage_box_screen.dart';
import 'package:laftel_clone/presentation/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

import 'bottom_navi_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MainViewModel>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      body: PageView(
        controller: viewModel.pageController,
        pageSnapping: false,
        children: [
          const MainScreenItem(),
          Container(),
          const StorageBoxScreen(),
          Container()
        ],
      ),
      bottomNavigationBar: BottomNaviItem(
        changeScreen: viewModel.changeScreen,
        currentIndex: viewModel.mainState.currentPage,
      ),
    );
  }
}
