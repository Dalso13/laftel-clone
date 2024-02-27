import 'package:flutter/material.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';

import '../../../main_screen_item/detail_item/preview_anime_item.dart';

class DetailAnimeRelatedScreen extends StatelessWidget {
  final List<SimpleAnimeModel> _relatedList;
  final void Function({required int id}) _onTab;

  const DetailAnimeRelatedScreen({
    super.key,
    required List<SimpleAnimeModel> relatedList,
    required void Function({required int id}) onTab,
  })  : _relatedList = relatedList,
        _onTab = onTab;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(
        right: 8,
        left: 8,
      ),
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: _relatedList.map((e) {
        return PreviewAnimeItem(
          model: e,
          onTab: _onTab,
        );
      }).toList(),
    );
  }
}
