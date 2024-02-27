import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:laftel_clone/core/detail_anime_menu_state.dart';

import '../../../core/response_state.dart';

part 'detail_anime_state.freezed.dart';

part 'detail_anime_state.g.dart';

@freezed
class DetailAnimeState with _$DetailAnimeState {
  const factory DetailAnimeState({
    @Default(ResponseState.loading) ResponseState detailResponseState,
    @Default(1) double seriesScreenHeight,
    @Default(DetailAnimeMenuState.episode) DetailAnimeMenuState menuState,
  }) = _DetailAnimeState;

  factory DetailAnimeState.fromJson(Map<String, Object?> json) => _$DetailAnimeStateFromJson(json);
}