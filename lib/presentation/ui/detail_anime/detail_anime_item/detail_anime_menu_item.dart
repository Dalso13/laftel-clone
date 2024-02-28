import 'package:flutter/material.dart';
import 'package:laftel_clone/core/detail_anime_menu_state.dart';

class DetailAnimeMenuItem extends StatelessWidget {
  final DetailAnimeMenuState _menuState;
  final void Function({required DetailAnimeMenuState menuState}) _onSelected;

  const DetailAnimeMenuItem({
    super.key,
    required DetailAnimeMenuState menuState,
    required void Function({required DetailAnimeMenuState menuState})
        onSelected,
  })  : _menuState = menuState,
        _onSelected = onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: DetailAnimeMenuState.values.map((e) {
      return TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        onPressed: () {
          _onSelected(menuState: e);
        },
        child: Text(
          e.kr,
          style: TextStyle(
            color: _menuState == e
                ? Theme.of(context).primaryColor
                : Theme.of(context).dividerColor,
          ),
        ),
      );
    }).toList());
  }
}
