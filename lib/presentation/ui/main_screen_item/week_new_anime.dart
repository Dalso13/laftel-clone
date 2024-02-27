import 'package:flutter/material.dart';
import 'package:laftel_clone/core/week_state.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/detail_item/preview_anime_item.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/main_state.dart';

import '../../../domain/model/simple_anime_model.dart';
import 'detail_item/week_change_item.dart';

class WeekNewAnime extends StatelessWidget {
  final MainState _state;
  final void Function(WeekState week) _onSelected;
  final List<SimpleAnimeModel> _animeList;
  final void Function() _onPressed;
  final void Function({required int id}) _onTab;

  const WeekNewAnime({
    super.key,
    required MainState state,
    required void Function(WeekState week) onSelected,
    required List<SimpleAnimeModel> animeList,
    required void Function() onPressed,
    required void Function({required int id}) onTab,
  })  : _state = state,
        _onSelected = onSelected,
        _animeList = animeList,
        _onPressed = onPressed,
        _onTab = onTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('요일별 신작',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: SizedBox(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.grey,
                            ),
                            padding: EdgeInsets.only(
                                top: 0, bottom: 0, right: 8, left: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        onPressed: () {},
                        child: Text('업로드 공지'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 100,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                        iconColor: Theme.of(context).dividerColor),
                    onPressed: () {
                      _onPressed();
                    },
                    icon: const SizedBox(
                        width: 10, child: Icon(Icons.arrow_back_ios)),
                    label: Text(
                      '더보기',
                      style: TextStyle(color: Theme.of(context).dividerColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        WeekChangeItem(
          onSelected: _onSelected,
          currentWeek: _state.currentWeek,
        ),
        SizedBox(
          height: 200,
          child: GridView.count(
              childAspectRatio: 0.8,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 15,
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              children: _animeList
                  .map((e) => PreviewAnimeItem(
                        model: e,
                        onTab: _onTab,
                      ))
                  .toList()),
        )
      ],
    );
  }
}
