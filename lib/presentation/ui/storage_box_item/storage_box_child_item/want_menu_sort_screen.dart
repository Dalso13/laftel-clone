import 'package:flutter/material.dart';

class MenuSortScreen extends StatelessWidget {
  final void Function() _onChanged;
  final bool _isEqual;
  final String _menuText;

  const MenuSortScreen({
    super.key,
    required void Function() onChanged,
    required bool isEqual,
    required String menuText,
  })  : _onChanged = onChanged,
        _isEqual = isEqual,
        _menuText = menuText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _onChanged,
      leading: _isEqual ? const Icon(Icons.check) : const Icon(null),
      title: Text(_menuText),
    );
  }
}
