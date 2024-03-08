import 'package:flutter/material.dart';
import 'package:laftel_clone/core/storage_box_menu_state.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/storage_box_state.dart';

class StorageBoxMenu extends StatelessWidget {
  final StorageBoxState _state;
  final void Function({required StorageBoxMenuState state}) _onPressed;

  const StorageBoxMenu({
    super.key,
    required StorageBoxState state,
    required void Function({required StorageBoxMenuState state}) onPressed,
  })  : _state = state,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: StorageBoxMenuState.values.map((e) {
        return Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            onPressed: () {
              _onPressed(state: e);
            },
            child: Text(
              e.kr,
              style: TextStyle(
                color: _state.currentMenu == e ? Theme.of(context).primaryColor : Theme.of(context).dividerColor,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
