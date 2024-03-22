import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';

part 'search_anime_model.freezed.dart';

part 'search_anime_model.g.dart';

@freezed
class SearchAnimeModel with _$SearchAnimeModel {
  const factory SearchAnimeModel({
      required int count,
      required List<SimpleAnimeModel> model,
      required String next,
  }) = _SearchAnimeModel;

  factory SearchAnimeModel.fromJson(Map<String, Object?> json) => _$SearchAnimeModelFromJson(json);
}