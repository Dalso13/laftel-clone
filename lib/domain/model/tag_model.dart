import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'tag_model.freezed.dart';

part 'tag_model.g.dart';

@freezed
class TagModel with _$TagModel {
  const factory TagModel({
    required int id,
    required String name,
    required String type,
  }) = _TagModel;
  
  factory TagModel.fromJson(Map<String, Object?> json) => _$TagModelFromJson(json); 
}