import 'package:flutter/material.dart';

import '../../../../../domain/model/detail_anime_model.dart';
import 'detail_anime_episode_item.dart';
import 'detail_anime_series_select.dart';

class DetailAnimeEpisodeScreen extends StatelessWidget {
  final DetailAnimeModel _model;
  final void Function({required int id}) _onTab;

  const DetailAnimeEpisodeScreen({
    super.key,
    required DetailAnimeModel model,
    required void Function({required int id}) onTab,
  })  : _model = model,
        _onTab = onTab;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:
          [
            DetailAnimeSeriesSelect(
              model: _model,
              onTab: _onTab,
            ),
            ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                .map((e) => DetailAnimeEpisodeItem(img: _model.img))
                .toList()
          ],
      ),
    );
  }
}
