import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'search_sealed.freezed.dart';

@freezed
sealed class SearchSealed with _$SearchSealed {
  const factory SearchSealed.viewPossible() = ViewPossible;
  const factory SearchSealed.membership() = Membership;
  const factory SearchSealed.tagSelect({required int tagNum}) = TagSelect;
  const factory SearchSealed.detailTagSelect({required String tagName}) = DetailTagSelect;
}