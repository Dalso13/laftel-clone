import 'package:flutter/material.dart';
import 'package:laftel_clone/core/week_state.dart';
import 'package:laftel_clone/presentation/ui/anime_option_item/uncensored_item.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/main_state.dart';

import '../../../domain/model/simple_anime_model.dart';
import '../anime_option_item/ad_free_item.dart';
import '../anime_option_item/dubbing_item.dart';
import '../anime_option_item/laftel_only_item.dart';

class WeekNewAnime extends StatelessWidget {
  final MainState _state;
  final void Function(WeekState week) _onSelected;
  final List<SimpleAnimeModel> _animeList;

  const WeekNewAnime({
    super.key,
    required MainState state,
    required void Function(WeekState week) onSelected,
    required List<SimpleAnimeModel> animeList,
  })  : _state = state,
        _onSelected = onSelected,
        _animeList = animeList;

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
                          padding: EdgeInsets.only(top: 0, bottom: 0, right: 8, left: 8),
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(0)
                          )
                        ),
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
                    onPressed: () {},
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: WeekState.values
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ChoiceChip(
                        labelPadding: const EdgeInsets.all(4.0),
                        label: Text(e.kr),
                        labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        backgroundColor: Colors.grey[400],
                        selectedColor: Colors.deepPurple[400],
                        selected: _state.currentWeek == e,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        onSelected: (bool value) {
                          _onSelected(e);
                        },
                        showCheckmark: false,
                        shape: const StadiumBorder(
                            side: BorderSide(style: BorderStyle.none)),
                      ),
                    ),
                  )
                  .toList()),
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
                  .map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.network(e.img,
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: double.infinity),
                              Positioned(
                                bottom: 0,
                                right: 4,
                                child: Row(
                                  children: [
                                    if (e.isLaftelOnly) const LaftelOnlyItem(),
                                    if (e.isDubbed) const DubbingItem(),
                                    if (e.isAvod) const AdFreeItem(),
                                    if (e.isUncensored) const UncensoredItem(),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            e.name,
                            style: TextStyle(color: Colors.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ))
                  .toList()),
        )
      ],
    );
  }
}
