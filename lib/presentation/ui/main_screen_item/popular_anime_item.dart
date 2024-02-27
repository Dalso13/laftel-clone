import 'package:flutter/material.dart';
import 'package:laftel_clone/core/Popular_anime_state.dart';

import '../../view_model/view_model_state/main_state.dart';

class PopularAnimeItem extends StatelessWidget {
  final MainState _state;
  final void Function(PopularAnimeState popular) _onSelected;
  final void Function({required int id}) _onTab;

  const PopularAnimeItem({
    super.key,
    required MainState state,
    required void Function(PopularAnimeState popular) onSelected,
    required void Function({required int id}) onTab,
  })  : _state = state,
        _onSelected = onSelected,_onTab = onTab;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                '라프텔 인기 애니',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              children: PopularAnimeState.values.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ChoiceChip(
                    labelPadding: const EdgeInsets.all(2.0),
                    label: Container(
                        width: 50,
                        height: 30,
                        alignment: AlignmentDirectional.center,
                        child: Text(e.kr)),
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _state.currentPopular == e
                          ? Colors.white
                          : Colors.black,
                    ),
                    selectedColor: Colors.deepPurple[400],
                    selected: _state.currentPopular == e,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    onSelected: (bool value) {
                      _onSelected(e);
                    },
                    showCheckmark: false,
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.grey)),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: GridView.count(
                childAspectRatio: 0.3,
                padding: const EdgeInsets.all(16),
                mainAxisSpacing: 15,
                crossAxisCount: 3,
                scrollDirection: Axis.horizontal,
                children: _state.weekAnimeList.take(9).map((e) {
                  return GestureDetector(
                    onTap: () {
                      _onTab(id: e.id);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          e.img,
                          width: 120,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 8, left: 8),
                            child: Text(
                              '${_state.weekAnimeList.indexOf(e) + 1}',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 16, bottom: 8),
                                child: Text(
                                  e.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                e.genres.take(2).join('/'),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
