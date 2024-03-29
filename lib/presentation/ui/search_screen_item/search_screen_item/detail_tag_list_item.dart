import 'package:flutter/material.dart';
import 'package:laftel_clone/core/tag_state.dart';
import '../../../view_model/view_model_state/search_state.dart';

class DetailTagListItem extends StatelessWidget {
  final SearchState _state;
  final TagCategoryState _tag;
  final void Function({required int tagNum}) _tagSelect;
  final void Function({required String tagName}) _detailTagSelect;

  const DetailTagListItem({
    super.key,
    required SearchState state,
    required TagCategoryState tag,
    required void Function({required int tagNum}) tagSelect,
    required void Function({required String tagName}) detailTagSelect,
  })  : _state = state,
        _tag = tag,
        _tagSelect = tagSelect,
        _detailTagSelect = detailTagSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
          ),
          child: ListTile(
            title: Text(
              _tag.kr,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: InkWell(
              onTap: () {
                _tagSelect(tagNum: _tag.tagNum);
              },
              child: Icon(_state.checkTag.contains(_tag.tagNum)
                  ? Icons.keyboard_arrow_up_sharp
                  : Icons.keyboard_arrow_down_sharp),
            ),
          ),
        ),
        _state.checkTag.contains(_tag.tagNum)
            ? Column(
                children: TagState.values
                    .where((e) => e.tagNum == _tag.tagNum)
                    .map((e) => detailTag(tag: e))
                    .toList(),
              )
            : const SizedBox.shrink()
      ],
    );
  }

  Widget detailTag({required TagState tag}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            tag.kr,
            style: TextStyle(
              fontSize: 13,
              color: _state.checkDetailTag.contains(tag.kr)
                  ? Colors.deepPurpleAccent
                  : _state.excludeDetailTag.contains(tag.kr)
                      ? Colors.redAccent
                      : Colors.black,
            ),
          ),
        ),
        trailing: InkWell(
            onTap: () {
              _detailTagSelect(tagName: tag.kr);
            },
            child: _state.checkDetailTag.contains(tag.kr)
                ? const Icon(
                    Icons.check_box_outlined,
                    color: Colors.deepPurpleAccent,
                  )
                : _state.excludeDetailTag.contains(tag.kr)
                    ? const Icon(
                        Icons.indeterminate_check_box_outlined,
                        color: Colors.redAccent,
                      )
                    : const Icon(
                        Icons.check_box_outline_blank,
                      )),
      ),
    );
  }
}
