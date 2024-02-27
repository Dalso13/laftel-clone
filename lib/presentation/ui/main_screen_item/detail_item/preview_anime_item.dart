import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/model/simple_anime_model.dart';
import '../../anime_option_item/ad_free_item.dart';
import '../../anime_option_item/dubbing_item.dart';
import '../../anime_option_item/laftel_only_item.dart';
import '../../anime_option_item/uncensored_item.dart';

class PreviewAnimeItem extends StatelessWidget {
  final SimpleAnimeModel _model;
  final void Function({required int id}) _onTab;

  const PreviewAnimeItem({
    super.key,
    required SimpleAnimeModel model,
    required void Function({required int id}) onTab,
  })  : _model = model,
        _onTab = onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTab(id: _model.id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(_model.img,
                  fit: BoxFit.cover,
                  height: 110,
                  width: double.infinity),
              Positioned(
                bottom: 0,
                right: 4,
                child: Row(
                  children: [
                    if (_model.isLaftelOnly) const LaftelOnlyItem(),
                    if (_model.isDubbed) const DubbingItem(),
                    if (_model.isAvod) const AdFreeItem(),
                    if (_model.isUncensored) const UncensoredItem(),
                  ],
                ),
              )
            ],
          ),
          Text(
            _model.name,
            style: const TextStyle(color: Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
