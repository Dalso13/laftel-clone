import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'simple_anime_model.freezed.dart';

part 'simple_anime_model.g.dart';

@freezed
class SimpleAnimeModel with _$SimpleAnimeModel {
  const factory SimpleAnimeModel({
    required int id,
    required String name,
    required String img,
    required List<String> genres,
    required String distributedAirTime,
    required bool isUncensored,
    required bool isLaftelOnly,
    required bool isDubbed,
    required bool isAvod,
    required bool isViewing,
    required bool isEpisodeExisted,
    required bool isExpired,
  }) = _SimpleAnimeModel;
  
  factory SimpleAnimeModel.fromJson(Map<String, Object?> json) => _$SimpleAnimeModelFromJson(json); 
}