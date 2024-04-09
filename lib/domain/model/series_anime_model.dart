import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'series_anime_model.freezed.dart';

part 'series_anime_model.g.dart';

@freezed
class SeriesAnimeModel with _$SeriesAnimeModel {
  const factory SeriesAnimeModel({
    required int id,
    required String name,
  }) = _SeriesAnimeModel;
  
  factory SeriesAnimeModel.fromJson(Map<String, Object?> json) => _$SeriesAnimeModelFromJson(json); 
}