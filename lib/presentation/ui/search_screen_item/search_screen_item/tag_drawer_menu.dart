import 'package:flutter/material.dart';
import 'package:laftel_clone/core/tag_state.dart';
import 'package:laftel_clone/presentation/ui/search_screen_item/search_screen_item/detail_tag_list_item.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/search_state.dart';
import '../../../ui_sealed/search_sealed.dart';

class TagDrawerMenu extends StatelessWidget {
  final SearchState _state;
  final void Function(SearchSealed event) _onEvent;

  const TagDrawerMenu({
    super.key,
    required SearchState state,
    required void Function(SearchSealed event) onEvent,
  })  : _state = state,
        _onEvent = onEvent;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 100,
        ),
        ListTile(
          title: Text(
            '감상 가능한 작품만 보기',
            style: TextStyle(
              fontSize: 13,
              color: _state.checkPossibleView
                  ? Theme.of(context).primaryColor
                  : Colors.black,
            ),
          ),
          trailing: InkWell(
            onTap: () {
              _onEvent(const SearchSealed.viewPossible());
            },
            child: Icon(
              _state.checkPossibleView
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
              color: _state.checkPossibleView
                  ? Theme.of(context).primaryColor
                  : Colors.black,
            ),
          ),
        ),
        ListTile(
          title: Text(
            '멤버십으로 감상 가능한 작품만 보기',
            style: TextStyle(
              fontSize: 13,
              color: _state.checkMembership
                  ? Theme.of(context).primaryColor
                  : Colors.black,
            ),
          ),
          trailing: InkWell(
            onTap: () {
              _onEvent(const SearchSealed.membership());
            },
            child: Icon(
              _state.checkMembership
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
              color: _state.checkMembership
                  ? Theme.of(context).primaryColor
                  : Colors.black,
            ),
          ),
        ),
        ...TagCategoryState.values.map((e) => DetailTagListItem(
              tag: e,
              state: _state,
              detailTagSelect: ({required String tagName}) {
                _onEvent(SearchSealed.detailTagSelect(tagName: tagName));
              },
              tagSelect: ({required int tagNum}) {
                _onEvent(SearchSealed.tagSelect(tagNum: tagNum));
              },
            ))
      ],
    );
  }
}
