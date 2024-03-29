import 'package:flutter/material.dart';

class SelectTagListItem extends StatelessWidget {
  final List<String> _tagNames;
  final void Function({required String tagName}) _onPressed;

  const SelectTagListItem({
    super.key,
    required List<String> tagNames,
    required void Function({required String tagName}) onPressed,
  })  : _tagNames = tagNames,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _tagNames
              .map((e) => Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            width: 0.5,
                            color: Colors.grey)),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 4, bottom: 4),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          _onPressed(tagName: e);
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.black,
                          size: 15,
                        ),
                        label: Text(
                          e,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
