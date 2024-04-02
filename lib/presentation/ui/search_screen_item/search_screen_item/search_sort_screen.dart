import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laftel_clone/core/search_sort_state.dart';

import '../../storage_box_item/storage_box_child_item/menu_sort_screen.dart';

class SearchSortScreen extends StatelessWidget {
  final void Function({required SearchSortState state}) _onChanged;
  final SearchSortState _currentState;

  const SearchSortScreen({
    super.key,
    required void Function({required SearchSortState state}) onChanged,
    required SearchSortState currentState,
  })  : _onChanged = onChanged,
        _currentState = currentState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...SearchSortState.values
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
