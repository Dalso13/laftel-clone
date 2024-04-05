import 'package:flutter/material.dart';
import 'package:laftel_clone/core/finder_sort_state.dart';

import '../../storage_box_item/storage_box_child_item/menu_sort_screen.dart';

class FinderSortScreen extends StatelessWidget {
  final void Function({required FinderSortState state}) _onChanged;
  final FinderSortState _currentState;

  const FinderSortScreen({
    super.key,
    required void Function({required FinderSortState state}) onChanged,
    required FinderSortState currentState,
  })  : _onChanged = onChanged,
        _currentState = currentState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...FinderSortState.values
            .map(
              (e) => MenuSortScreen(
                onChanged: () {
                  _onChanged(state: e);
                },
                isEqual: _currentState == e,
                menuText: e.kr,
              ),
            )
            .toList(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.clear),
                  title: const Text('취소'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
