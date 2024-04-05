import 'package:flutter/material.dart';
import '../../../domain/model/simple_anime_model.dart';
import '../main_screen_item/detail_item/preview_anime_item.dart';

class SimpleAnimeGridView extends StatelessWidget {
  final ScrollController? _controller;
  final List<SimpleAnimeModel> _modelList;
  final void Function({required int id}) _goDetailScreen;


  const SimpleAnimeGridView({
    super.key,
    ScrollController? controller,
    required List<SimpleAnimeModel> modelList,
    required void Function({required int id}) goDetailScreen,
  })  : _controller = controller,
        _modelList = modelList,
        _goDetailScreen = goDetailScreen;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        padding:
        const EdgeInsets.only(left: 8, right: 8, bottom: 16, top: 16),
        controller: _controller,
        children: _modelList.map(
              (e) => PreviewAnimeItem(
            model: e,
            onTab: _goDetailScreen
          ),
        ).toList(),
      ),
    );
  }
}
