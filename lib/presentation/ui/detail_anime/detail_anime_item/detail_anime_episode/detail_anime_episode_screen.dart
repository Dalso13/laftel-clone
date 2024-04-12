import 'package:flutter/material.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/detail_anime_state.dart';

import '../../../../../domain/model/detail_anime_model.dart';
import 'detail_anime_episode_item.dart';
import 'detail_anime_series_select.dart';

class DetailAnimeEpisodeScreen extends StatelessWidget {
  final DetailAnimeState _state;
  final DetailAnimeModel _model;
  final void Function({required int id}) _onTab;

  const DetailAnimeEpisodeScreen({
    super.key,
    required DetailAnimeState state,
    required DetailAnimeModel model,
    required void Function({required int id}) onTab,
  })  : _state = state,
        _model = model,
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
            ..._state.episodeList.map((e) => DetailAnimeEpisodeItem(model: e)).toList()
          ],
      ),
    );
  }
}
