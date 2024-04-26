import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:laftel_clone/core/finder_sort_state.dart';
import 'package:laftel_clone/core/tag_state.dart';
import '../../../domain/model/simple_anime_model.dart';

part 'finder_state.freezed.dart';

part 'finder_state.g.dart';

@freezed
class FinderState with _$FinderState {
  const factory FinderState({
    @Default(FinderSortState.rank) FinderSortState currentState,
    @Default([]) List<SimpleAnimeModel> finderAnimeList,
    @Default([]) List<TagState> checkDetailTag,
    @Default([]) List<String> excludeDetailTag,
    @Default([]) List<int> checkTag,
    @Default(0) int finderAnimeListCount,
    @Default('') String nextUri,
    @Default(false) bool isPagination,
    @Default(true) bool checkPossibleView,
    @Default(false) bool checkMembership,
  }) = _SearchState;

  factory FinderState.fromJson(Map<String, Object?> json) => _$FinderStateFromJson(json);
}