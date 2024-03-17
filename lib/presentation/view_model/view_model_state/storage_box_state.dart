import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:laftel_clone/core/storage_box_menu_state.dart';
import '../../../core/storage_box_sort_state.dart';

part 'storage_box_state.freezed.dart';

part 'storage_box_state.g.dart';

@freezed
class StorageBoxState with _$StorageBoxState {
  const factory StorageBoxState({
    @Default(StorageBoxMenuState.recent) StorageBoxMenuState currentMenu,
    @Default(StorageWantState.add) StorageWantState currentWantMenuSortState,
    @Default(StorageBoughtState.bought) StorageBoughtState currentBoughtMenuSortState,
    @Default(StorageRelayState.view) StorageRelayState currentRelayMenuSortState,
  }) = _StorageBoxState;

  factory StorageBoxState.fromJson(Map<String, Object?> json) => _$StorageBoxStateFromJson(json);
}