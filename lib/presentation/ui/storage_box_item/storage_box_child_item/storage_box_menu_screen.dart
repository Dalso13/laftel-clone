
import 'package:flutter/material.dart';

import '../../../../core/storage_box_menu_state.dart';

class StorageBoxMenuScreen extends StatelessWidget {
  final StorageBoxMenuState _state;

  const StorageBoxMenuScreen({
    super.key,
    required StorageBoxMenuState state,
  }) : _state = state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('작품 (0)'),
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text(emptyText()),
          ),
        ),
      ],
    );
  }

  String emptyText() {
    String text;
    switch(_state) {
      case StorageBoxMenuState.recent:
        text = '최근 본 작품이 아직 없어요.';
      case StorageBoxMenuState.want:
        text = '보고싶은 작품이 아직 없어요.';
      case StorageBoxMenuState.download:
        text = '다운로드 한 작품이 아직 없어요.';
      case StorageBoxMenuState.bought:
        text = '구매한 작품이 아직 없어요.';
      case StorageBoxMenuState.relay:
        text = '정주행 중인 작품이 아직 없어요.';
    }
    return text;
  }

}
