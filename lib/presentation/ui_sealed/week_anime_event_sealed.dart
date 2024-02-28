import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../core/week_state.dart';

part 'week_anime_event_sealed.freezed.dart';

@freezed
sealed class WeekAnimeEventSealed<T> with _$WeekAnimeEventSealed<T> {
  const factory WeekAnimeEventSealed.onSelected({required WeekState week}) = OnSelected;
  const factory WeekAnimeEventSealed.onPressed() = OnPressed;
  const factory WeekAnimeEventSealed.goNoticePage() = GoNoticePage;
}
