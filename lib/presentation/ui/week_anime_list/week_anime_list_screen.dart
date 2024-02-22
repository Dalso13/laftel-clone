import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/week_state.dart';
import '../../view_model/main_view_model.dart';
import '../main_screen_item/detail_item/preview_anime_item.dart';
import '../main_screen_item/detail_item/week_change_item.dart';

class WeekAnimeListScreen extends StatelessWidget {
  const WeekAnimeListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MainViewModel viewModel = context.watch<MainViewModel>();
    final state = viewModel.mainState;
    return Scaffold(
      appBar: AppBar(
        title: const Text('요일별 신작'),
      ),
      body: Column(
        children: [
          WeekChangeItem(
            onSelected: (WeekState week) {
              viewModel.weekButtonChange(week);
            },
            currentWeek: state.currentWeek,
          ),
          Expanded(
            child: GridView.count(
              crossAxisSpacing: 15,
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 16, top: 16),
              crossAxisCount: 2,
              children: viewModel
                  .getNowDayAnimeList(state.currentWeek)
                  .map((e) => PreviewAnimeItem(model: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
