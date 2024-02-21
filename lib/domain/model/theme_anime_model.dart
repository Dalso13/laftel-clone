import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';

part 'theme_anime_model.freezed.dart';

part 'theme_anime_model.g.dart';

@freezed
class ThemeAnimeModel with _$ThemeAnimeModel {
  const factory ThemeAnimeModel({
    required int themeId,
    required String title,
    required List<SimpleAnimeModel> themeItemList,
  }) = _ThemeAnimeModel;

  factory ThemeAnimeModel.fromJson(Map<String, Object?> json) => _$ThemeAnimeModelFromJson(json);
}