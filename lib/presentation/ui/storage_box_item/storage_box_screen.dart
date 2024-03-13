import 'package:flutter/material.dart';
import 'package:laftel_clone/presentation/ui/storage_box_item/storage_box_child_item/storage_box_menu.dart';
import 'package:laftel_clone/presentation/ui/storage_box_item/storage_box_child_item/storage_box_menu_screen.dart';
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
                  return StorageBoxMenuScreen(
                    state: e,
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}
