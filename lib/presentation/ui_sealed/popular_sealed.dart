import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'popular_sealed.freezed.dart';

@freezed
sealed class PopularSealed with _$PopularSealed {
  const factory PopularSealed.realTime() = RealTime;
  const factory PopularSealed.week() = Week;
  const factory PopularSealed.quarter() = Quarter;
  const factory PopularSealed.allTime() = AllTime;
}