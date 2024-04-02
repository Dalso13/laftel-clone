import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:laftel_clone/core/search_sort_state.dart';
import '../../../domain/model/simple_anime_model.dart';

part 'search_state.freezed.dart';

part 'search_state.g.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchSortState.rank) SearchSortState currentState,
    @Default([]) List<SimpleAnimeModel> searchAnimeList,
    @Default([]) List<String> checkDetailTag,
    @Default([]) List<String> excludeDetailTag,
    @Default([]) List<int> checkTag,
    @Default(0) int searchAnimeListCount,
    @Default('') String nextUri,
    @Default(false) bool isPagination,
    @Default(true) bool checkPossibleView,
    @Default(false) bool checkMembership,
  }) = _SearchState;

  factory SearchState.fromJson(Map<String, Object?> json) => _$SearchStateFromJson(json);
}