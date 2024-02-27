import 'package:flutter/material.dart';
import 'package:laftel_clone/presentation/ui/detail_anime/detail_anime_item/detail_anime_episode/series_list_screen.dart';

import '../../../../../domain/model/detail_anime_model.dart';

class DetailAnimeSeriesSelect extends StatelessWidget {
  final DetailAnimeModel _model;
  final void Function({required int id}) _onTab;

  const DetailAnimeSeriesSelect({
    super.key,
    required DetailAnimeModel model,
    required void Function({required int id}) onTab,
  })  : _model = model,
        _onTab = onTab;

  @override
  Widget build(BuildContext context) {
    return _model.seriesItem.isEmpty
        ? getTile(Theme.of(context))
        : GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8))),
                builder: (context) {
                  return DraggableScrollableSheet(
                    expand: false,
                    minChildSize: 0.2,
                    initialChildSize: 0.5,
                    builder: (context, scrollController) => SeriesListScreen(
                      series: _model.seriesItem,
                      onTab: _onTab,
                    ),
                  );
                },
              );
            },
            child: getTile(Theme.of(context), isSeries: true),
          );
  }

  Widget getTile(ThemeData theme, {bool isSeries = false}) {
    return ListTile(
      title: Row(
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              _model.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: theme.dividerColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          isSeries ? const Icon(Icons.keyboard_arrow_down) : Container()
        ],
      ),
      trailing: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 70,
          child: Row(
            children: [
              Text(
                '1화 부터',
                style: TextStyle(color: theme.dividerColor),
              ),
              Icon(
                Icons.swap_vert,
                color: theme.dividerColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
