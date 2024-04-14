import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'episode_anime_model.freezed.dart';

part 'episode_anime_model.g.dart';

@freezed
class EpisodeAnimeModel with _$EpisodeAnimeModel {
  const factory EpisodeAnimeModel({
    required int id,
    required int episodeOrder,
    required String title,
    required String thumbnailPath,
    required String subject,
    required String description,
    required Duration runningTime,
    required DateTime itemExpireDatetime,
    required bool hasPreview,
    required bool inAppDownload,
    required bool isAvod,
    required bool isFree,
    required bool isViewing,
    required bool isAvailable,
  }) = _EpisodeAnimeModel;

  factory EpisodeAnimeModel.fromJson(Map<String, Object?> json) => _$EpisodeAnimeModelFromJson(json);
}