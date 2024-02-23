import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'animation_info_model.freezed.dart';

part 'animation_info_model.g.dart';

@freezed
class AnimationInfoModel with _$AnimationInfoModel {
  const factory AnimationInfoModel({
    required String production,
    required String airYearQuarter,
    required bool isDubbed,
    required bool isLaftelOnly,
    required bool isLaftelOriginal,
    required bool isUncensored,
    required String season,
  }) = _AnimationInfoModel;

  factory AnimationInfoModel.fromJson(Map<String, Object?> json) => _$AnimationInfoModelFromJson(json);
}