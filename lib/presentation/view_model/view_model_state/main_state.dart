import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:laftel_clone/core/Popular_anime_state.dart';
import 'package:laftel_clone/core/week_state.dart';
import 'package:laftel_clone/domain/model/theme_anime_model.dart';

import '../../../domain/model/simple_anime_model.dart';

part 'main_state.freezed.dart';

part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(WeekState.sunday) WeekState currentWeek,
    @Default([]) List<SimpleAnimeModel> weekAnimeList,
    @Default([]) List<ThemeAnimeModel> themeAnimeList,
    @Default(PopularAnimeState.realTime) PopularAnimeState currentPopular,
    @Default(true) bool isLoading,
  }) = _MainState;

  factory MainState.fromJson(Map<String, Object?> json) => _$MainStateFromJson(json);
}