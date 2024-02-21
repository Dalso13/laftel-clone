import 'package:flutter/material.dart';
import 'package:laftel_clone/core/week_state.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/main_state.dart';

import '../../../domain/model/simple_anime_model.dart';

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
                  Text('요일별 신작'),
                  TextButton(
                    onPressed: () {},
                    child: Text('업로드 공지'),
                  ),
                ],
              ),
              Text('더보기 >')
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
                        shape: const StadiumBorder(side: BorderSide(style: BorderStyle.none)),
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
                  .map(
                    (e) =>  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(e.img,
                            fit: BoxFit.cover, height: 120,width: double.infinity),
                        Text(
                          e.name,
                          style: TextStyle(color: Colors.black),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
              )
                  .toList()),
        )
      ],
    );
  }
}
