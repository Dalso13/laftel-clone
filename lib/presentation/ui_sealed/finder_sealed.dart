import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:laftel_clone/core/tag_state.dart';

part 'finder_sealed.freezed.dart';

@freezed
sealed class FinderSealed with _$FinderSealed {
  const factory FinderSealed.viewPossible() = ViewPossible;
  const factory FinderSealed.membership() = Membership;
  const factory FinderSealed.tagSelect({required int tagNum}) = TagSelect;
  const factory FinderSealed.detailTagSelect({required TagState tagState}) = DetailTagSelect;
}