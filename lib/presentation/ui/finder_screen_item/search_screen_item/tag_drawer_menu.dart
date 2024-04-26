import 'package:flutter/material.dart';
import 'package:laftel_clone/core/tag_state.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/finder_state.dart';
import '../../../ui_sealed/finder_sealed.dart';
import 'detail_tag_list_item.dart';

class TagDrawerMenu extends StatelessWidget {
  final FinderState _state;
  final void Function(FinderSealed event) _onEvent;

  const TagDrawerMenu({
    super.key,
    required FinderState state,
    required void Function(FinderSealed event) onEvent,
  })  : _state = state,
        _onEvent = onEvent;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(
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
              _onEvent(const FinderSealed.viewPossible());
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
              _onEvent(const FinderSealed.membership());
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
              detailTagSelect: ({required TagState tag}) {
                _onEvent(FinderSealed.detailTagSelect(tagState: tag));
              },
              tagSelect: ({required int tagNum}) {
                _onEvent(FinderSealed.tagSelect(tagNum: tagNum));
              },
            ))
      ],
    );
  }
}
