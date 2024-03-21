import 'package:flutter/material.dart';
import 'package:laftel_clone/core/storage_box_sort_state.dart';
import 'package:laftel_clone/presentation/ui/storage_box_item/storage_box_child_item/storage_box_menu.dart';
import 'package:laftel_clone/presentation/ui/storage_box_item/storage_box_child_item/storage_box_menu_screen.dart';
import 'package:laftel_clone/presentation/ui/storage_box_item/storage_box_child_item/want_menu_sort_screen.dart';
import 'package:laftel_clone/presentation/ui/storage_box_item/storage_keep_alive_screen.dart';
import 'package:laftel_clone/presentation/view_model/storage_box_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/storage_box_menu_state.dart';

class StorageBoxScreen extends StatelessWidget {
  const StorageBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<StorageBoxViewModel>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('보관함',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        actions: [clearButton(viewModel.state.currentMenu)],
      ),
      body: Column(
        children: [
          const Divider(),
          StorageBoxMenu(
            onPressed: ({required StorageBoxMenuState state}) {
              viewModel.clickMenuChange(currentMenu: state);
            },
            state: viewModel.state,
          ),
          const Divider(),
          Expanded(
            child: PageView(
                onPageChanged: viewModel.snapMenuChange,
                controller: viewModel.pageController,
                children: StorageBoxMenuState.values.map((e) {
                  return StorageKeepAlivePage(
                    child: StorageBoxMenuScreen(
                      state: e,
                      sortButton: ({required StorageBoxMenuState state}) {
                        void onPressed({required Widget widget}) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return DraggableScrollableSheet(
                                  expand: false,
                                  minChildSize: 0.2,
                                  initialChildSize: 0.5,
                                  builder: (context, scrollController) =>
                                      widget);
                            },
                          );
                        }

                        Widget cancel() {
                          return ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            leading: const Icon(null),
                            title: const Text('취소'),
                          );
                        }

                        switch (state) {
                          case StorageBoxMenuState.recent:
                            return const SizedBox.shrink();
                          case StorageBoxMenuState.want:
                            return sortButton(
                                onPressed: () {
                                  onPressed(
                                      widget: Column(
                                    children: [
                                      ...StorageWantState.values
                                          .map((e) => MenuSortScreen(
                                              onChanged: () {
                                                viewModel.wantSortMenuChange(state: e);
                                                Navigator.pop(context);
                                              },
                                              isEqual: e ==
                                                  viewModel.state
                                                      .currentWantMenuSortState,
                                              menuText: e.kr))
                                          .toList(),
                                      cancel(),
                                    ],
                                  ));
                                },
                                text: viewModel
                                    .state.currentWantMenuSortState.kr);
                          case StorageBoxMenuState.download:
                            return const SizedBox.shrink();
                          case StorageBoxMenuState.bought:
                            return sortButton(
                                onPressed: () {
                                  onPressed(
                                      widget: Column(
                                    children: [
                                      ...StorageBoughtState.values
                                          .map((e) => MenuSortScreen(
                                              onChanged: () {
                                                viewModel.boughtSortMenuChange(state: e);
                                                Navigator.pop(context);
                                              },
                                              isEqual: e ==
                                                  viewModel.state
                                                      .currentBoughtMenuSortState,
                                              menuText: e.kr))
                                          .toList(),
                                      cancel(),
                                    ],
                                  ));
                                },
                                text: viewModel
                                    .state.currentBoughtMenuSortState.kr);
                          case StorageBoxMenuState.relay:
                            return sortButton(
                                onPressed: () {
                                  onPressed(
                                      widget: Column(
                                    children: [
                                      ...StorageRelayState.values
                                          .map((e) => MenuSortScreen(
                                              onChanged: () {
                                                viewModel.relaySortMenuChange(state: e);
                                                Navigator.pop(context);
                                              },
                                              isEqual: e ==
                                                  viewModel.state
                                                      .currentRelayMenuSortState,
                                              menuText: e.kr))
                                          .toList(),
                                      cancel(),
                                    ],
                                  ));
                                },
                                text: viewModel
                                    .state.currentRelayMenuSortState.kr);
                        }
                      },
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }

  Widget clearButton(StorageBoxMenuState state) {
    final icon =
        IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline));
    switch (state) {
      case StorageBoxMenuState.recent:
        return icon;
      case StorageBoxMenuState.want:
        return const SizedBox.shrink();
      case StorageBoxMenuState.download:
        return icon;
      case StorageBoxMenuState.bought:
        return const SizedBox.shrink();
      case StorageBoxMenuState.relay:
        return icon;
    }
  }

  Widget sortButton(
      {required void Function() onPressed, required String text}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextButton.icon(
        style: TextButton.styleFrom(iconColor: Colors.grey[700]),
        onPressed: onPressed,
        icon: const SizedBox(child: Icon(Icons.keyboard_arrow_down_sharp)),
        label: Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
    );
  }
}
