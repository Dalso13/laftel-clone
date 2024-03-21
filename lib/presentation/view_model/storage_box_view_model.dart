import 'package:flutter/material.dart';
import 'package:laftel_clone/core/storage_box_menu_state.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/storage_box_state.dart';

import '../../core/storage_box_sort_state.dart';

class StorageBoxViewModel extends ChangeNotifier {
  StorageBoxState _state = const StorageBoxState();
  final pageController = PageController(keepPage: true);

  StorageBoxState get state => _state;

  void clickMenuChange({required StorageBoxMenuState currentMenu}) {
    if(currentMenu == _state.currentMenu) return;
    _state = _state.copyWith(currentMenu: currentMenu);
    pageController.animateToPage(
      currentMenu.idx,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    notifyListeners();
  }

  void snapMenuChange(int index) {
    final changeMenu = StorageBoxMenuState.values.where((e) => e.idx == index).toList();
    _state = _state.copyWith(currentMenu: changeMenu.first);
    notifyListeners();
  }

  void wantSortMenuChange({required StorageWantState state}) {
    _state = _state.copyWith(currentWantMenuSortState: state);
    notifyListeners();
  }
  void boughtSortMenuChange({required StorageBoughtState state}) {
    _state = _state.copyWith(currentBoughtMenuSortState: state);
    notifyListeners();
  }
  void relaySortMenuChange({required StorageRelayState state}) {
    _state = _state.copyWith(currentRelayMenuSortState: state);
    notifyListeners();
  }


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}