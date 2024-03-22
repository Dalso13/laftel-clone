import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../../domain/model/simple_anime_model.dart';

part 'search_state.freezed.dart';

part 'search_state.g.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<SimpleAnimeModel> searchAnimeList,
    @Default(0) int searchAnimeListCount,
    @Default('') String nextUri,
  }) = _SearchState;

  factory SearchState.fromJson(Map<String, Object?> json) => _$SearchStateFromJson(json);
}