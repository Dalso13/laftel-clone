import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:laftel_clone/core/detail_anime_menu_state.dart';
import 'package:laftel_clone/domain/model/episode_anime_model.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';

import '../../../core/response_state.dart';

part 'detail_anime_state.freezed.dart';

part 'detail_anime_state.g.dart';

@freezed
class DetailAnimeState with _$DetailAnimeState {
  const factory DetailAnimeState({
    @Default(ResponseState.loading) ResponseState detailResponseState,
    @Default(0.0) double rating,
    @Default(false) bool spoiler,
    @Default(DetailAnimeMenuState.episode) DetailAnimeMenuState menuState,
    @Default([]) List<int> selectEpisode,
    @Default([]) List<SimpleAnimeModel> seriesList,
    @Default([]) List<EpisodeAnimeModel> episodeList,
    @Default(false) bool episodeSorting,
  }) = _DetailAnimeState;

  factory DetailAnimeState.fromJson(Map<String, Object?> json) => _$DetailAnimeStateFromJson(json);
}