import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:laftel_clone/domain/model/animation_info_model.dart';
import 'package:laftel_clone/domain/model/simple_anime_model.dart';
import 'package:laftel_clone/domain/model/tag_model.dart';

part 'detail_anime_model.freezed.dart';

part 'detail_anime_model.g.dart';

@freezed
class DetailAnimeModel with _$DetailAnimeModel {
  const factory DetailAnimeModel({
    required int id,
    required String name,
    required String type,
    required String img,
    required String content,
    required List<String> author,
    required String contentRating,
    required bool isAdult,
    required bool viewable,
    required double avgRating,
    required AnimationInfoModel animationInfo,
    required List<TagModel> mainTag,
    required List<SimpleAnimeModel> relatedItem,
    required List<SimpleAnimeModel> seriesItem,
  }) = _DetailAnimeModel;

  factory DetailAnimeModel.fromJson(Map<String, Object?> json) => _$DetailAnimeModelFromJson(json);
}